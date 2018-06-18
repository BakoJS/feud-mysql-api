const express = require("express");
const bodyParser = require("body-parser");
const cors = require("cors");
const mysql = require('mysql');
const Q = require("Q");

const app = express();

app.listen(3000, function() {
  console.log("listening on 3000");
});
const connection = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "",
  database: "developer_feud"
});

// Middleware
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));
app.use(cors());

connection.connect(function(err) {
  if (err) {
    console.error("error connecting: " + err.stack);
    return;
  }

  console.log("connected as id " + connection.threadId);
});

app.get("/", (req, res) => {
  res.send("Welcome to the Developer Feud Mysql API!");
});

function groupQuestionAnswers(rows) {
  var data = {};
  rows.forEach(function name(r) {
    if(!data.hasOwnProperty(r.QuestionID)){
      data[r.QuestionID] = { QuestionID: r.QuestionID, QuestionText: r.QuestionText, Answers: [] };
    }
    if (r.AnswerID == null) return;
    data[r.QuestionID].Answers.push({
      AnswerID: r.AnswerID,
      AnswerText: r.AnswerText,
      AnswerVotes: r.AnswerVotes
    });
  });
  return Object.values(data);
}

function addVote(AnswerID, UserID, callback) {

  connection.query(
    "INSERT IGNORE INTO votes(AnswerID,UserID) VALUES(?,?)", 
    [AnswerID, UserID],
    function(err, results, field) {
      if (err) throw err;
      getAnswer(AnswerID,function(data){
        if(callback) callback(data);
      });

    }
  );

}

function getAnswer(AnswerID, callback) {
  connection.query(
    "UPDATE answers SET AnswerVotes = (select COUNT(*) FROM votes WHERE votes.AnswerID = answers.AnswerID) WHERE AnswerID = ?",
    [AnswerID],
    function(err2, results2, field2) {
      if (err2) throw err2;

      connection.query(
        "SELECT * FROM answers WHERE AnswerID = ?",
        [AnswerID],
        function(err3, results3, field3) {
          if (err3) throw err2;
          console.log(results3);
          if (callback) callback(results3[0]);
        }
      );


    }
  );
}

function getQuestionRec (id){
  var d = Q.defer();
  connection.query(
    "SELECT * FROM questions Left Join answers on QuestionID = FK_QuestionID where QuestionID = ? order by QuestionID, AnswerVotes Desc",
    [id],
    function(err, results, field) {
      if (err) throw err;
      d.resolve(groupQuestionAnswers(results));
    }
  );
  return d.promise;
}

app.post("/question", (req, res) => {
  connection.query("INSERT INTO questions ( QuestionText, createDate, updateDate ) VALUES ( ?, now(), now() )", 
  [req.body.questionText], 
  function(err,results,field){
    if (err) throw err;
    getQuestionRec(results.insertId).then(record => res.send(record));
  });
});

app.get("/questions", (req, res) => {
  connection.query(
    "SELECT * FROM questions Left Join answers on QuestionID = FK_QuestionID WHERE questions.deleteDate is null and  answers.deleteDate is null Order by QuestionID, AnswerVotes",
    function(err, results, field) {
      if (err) throw err;
      console.log("The solution is: ", JSON.stringify(results));
      res.json(groupQuestionAnswers(results));
    }
  );
});


app.delete("/question/:id", (req, res) => {
  connection.query("UPDATE questions SET deleteDate = now() WHERE QuestionID = ?",[req.params.id],
   function(err, results, field) {
    if (err) throw err;
    console.log(results);
    res.sendStatus(200);
  });
});


app.get("/answers", (req, res) => {
  connection.query(
    "SELECT * FROM answers",
    function(err, results, field) {
      if (err) throw err;
      console.log(results);
      res.json(results);
    }
  );
});

app.get("/answer/:id", (req, res) => {
  getAnswer(req.params.id,function (data) {
    res.json(data);
  });
});

app.post("/answer", (req, res) => {
  connection.query(
    "INSERT IGNORE INTO answers(AnswerText,FK_QuestionID,AnswerVotes,createDate,updateDate) VALUES(?,?,0,now(),now()) ON DUPLICATE KEY UPDATE AnswerID=LAST_INSERT_ID(AnswerID)",
    [req.body.text, req.body.questionID],
    function(err, results, field) {
      if (err) throw err;
      console.log(results);
      addVote(results.insertId, req.body.userID, function(data) {
        res.json(data);
      });
    }
  );
});

app.delete("/answer/:id", (req, res) => {
  connection.query(
    "UPDATE answers SET deleteDate = now() WHERE AnswerID = ?",
    [req.params.id],
    function(err, results, field) {
      if (err) throw err;
      console.log(results);
      res.sendStatus(200);
    }
  );
});

app.post("/vote", (req, res) => {
  addVote(req.body.answerID, req.body.userID, function (data) {
    res.json(data);
  });
});

app.post("/unvote", (req, res) => {
  connection.query(
    "DELETE FROM votes WHERE AnswerID = ? and UserID = ?",
    [req.body.answerID, req.body.userID],
    function(err, results, field) {
      if (err) throw err;
      getAnswer(req.body.answerID, function (data) {
        res.json(data);
      });
    }
  );
});

app.post("/uservotes", (req, res) => {
  connection.query(
    "SELECT * FROM votes WHERE UserID = ?",
    [req.body.userID],
    function(err, results, field) {
      if (err) throw err;
      var data = results.map(function(x){
        return x.AnswerID;
      });
      res.json(data);
    }
  );
});

