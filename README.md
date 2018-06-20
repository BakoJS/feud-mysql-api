# feud-mysql-api
MySQL Developer Feud Database &amp; API

## Import the Database

The `server.js` file currently has the following settings

* host - `localhost`
* username - `root`
* password - ``
* database - `developer_feud`

If your mysql server has different settings, please update the server.js now. Please do not commit these changes back to the repo.

The repo has a sql file called `developer_feud.sql` to import.

## Install Node Dependencies

This app has several dependencies for Node to run a API server. To install these, we'll use NPM.

cd into the app directory and then type

`npm install`

## Start the server

Once you have created your db, imported your content, updated the server.js to match your db credentials, you are ready to start the API server.

cd into the app directory and then type

`node server.js`
