#!/bin/zsh

echo "What is the name of your project?"
read ProjectName
echo "What port will your server be listening on?"
read PORT
echo "*******************************"
echo "*Creating Project $ProjectName*"
echo "*******************************"

# #Make Directories
mkdir $ProjectName
echo $PORT
touch $ProjectName/index.js

# #Protect node_modules in .gitignore
echo "***********************************"
echo "*Adding node_modules to .gitignore*"
echo "*****Adding .eng to .gitignore*****"
echo "***********************************"

echo node_modules >> $ProjectName/.gitignore
echo .env >> $ProjectName/.gitignore
echo .DS_Store >> $ProjectName/.gitignore

echo "Creating .env file"

echo "DB_USER=
DB_PASSWORD=
DB_NAME=
DB_HOST=
SESSION_SECRET=" >>  $ProjectName/.env

echo "Protecting sessions in .gitignore"
echo sessions >> $ProjectName/.gitignore

echo "Creating .sequelizerc file"
echo "'use strict';
require('dotenv').config();    // don't forget to require dotenv
const path = require('path');
module.exports = {
  'config': path.resolve('config', 'config.js'),
  'models-path': path.resolve('models'),
  'seeders-path': path.resolve('seeders'),
  'migrations-path': path.resolve('migrations'),
};" >> $ProjectName/.sequelizerc

echo "*******************************"
echo "********Creating index.js********"
echo "*******************************"


echo "
require('dotenv').config();
const http = require('http');
const express = require('express');
const helmet = require('helmet');
const morgan = require('morgan');
const es6Renderer = require('express-es6-template-engine');
const session = require('express-session');
const FileStore = require('session-file-store')(session);
const app = express();
const server = http.createServer(app);


const logger = morgan('dev');
const HOST = 'localhost';
const PORT = $PORT

//Register Middleware
app.use(logger);
app.use(helmet());
app.use(express.urlencoded({ extended: true }));

app.use(express.static('public'));

app.use(session({
    store: new FileStore(),  // no options for now
    secret: process.env.SESSION_SECRET,
    saveUninitialized: false,
    resave: true,
    rolling: true,
    cookie: {
        maxAge: 1000 * 60 * 60 * 24 * 7
    }
}));

app.engine('html', es6Renderer);
app.set('views', 'templates');
app.set('view engine', 'html');


app.get('/', (req, res) =>{
    res.send('Your app is running. Start building!')
});

//catch all if website doesn't
app.get('*', (req, res) => {
    res.status(404).send('<h1>Page not found</h1>');
});

server.listen(PORT, HOST, () => {
    console.log(`Listening at http://${HOST}:${PORT}`);
});
" >> $ProjectName/index.js

# #Initialize as node package
cd $ProjectName
npm init -y
cd ..

echo "*********************************"
echo "*********installing morgan*******"
echo "*********************************"

npm install morgan --prefix $ProjectName

echo "*********************************"
echo "********installing express*******"
echo "*********************************"

npm install express --prefix $ProjectName

echo "*********************************"
echo "***sequelize, pg, pg-hstore******"
echo "*********bcryptjs, session*********"
echo "*********************************"

npm install sequelize --prefix $ProjectName
npm install pg --prefix $ProjectName
npm install pg-hstore --prefix $ProjectName
npm install bcryptjs --prefix $ProjectName
npm install session --prefix $ProjectName
npm install --save-dev sequelize-cli --prefix $ProjectName
npm install path --prefix $ProjectName
npm install dotenv --prefix $ProjectName
npm install --save-dev nodemon --prefix $ProjectName
npm install helmet --prefix $ProjectName
npm install express-session --prefix $ProjectName
npm install session-file-store --prefix $ProjectName

# echo "*********************************"
# echo "***Installing Standard Packages**"
# echo "*********************************"

# npm install --prefix $ProjectName

echo "*********************************"
echo "*installing es6-template-engine**"
echo "*********************************"


npm install express-es6-template-engine --prefix $ProjectName


echo "*********************************"
echo "***Initializing Sequelize-cli****"
echo "*********************************"

cd $ProjectName
npx sequelize-cli init

cd ..

mkdir $ProjectName/public $ProjectName/templates $ProjectName/routes
mkdir $ProjectName/controllers
touch $ProjectName/controllers/index.js
touch $ProjectName/routes/index.js
mkdir $ProjectName/public/stylesheets
touch $ProjectName/public/stylesheets/style.css
touch $ProjectName/README.md


echo "require('dotenv').config();
module.exports = {
  development: {
    username: process.env.DB_USER,
    password: process.env.DB_PASSWORD,
    database: process.env.DB_NAME,
        host: process.env.DB_HOST,
    dialect: 'postgres',
  }
};" > $ProjectName/config/config.js

echo '
// add to package.json
    "dev": "nodemon index.js",
      "nodemonConfig": {
        "ignore": [
         "sessions/*"] 
         },

// add to index.js
    `Listening at http://${HOST}:${PORT}`

// add to models/index.js
    require('dotenv').config();
         '>> $ProjectName/additional_Add_To.md

echo "********************************"
echo "********************************"
echo "You're ready to go. 
    Nodemon has been installed, but
    you'll need to add it to your 
    scripts and dev dependencies in 
    package.json."

echo "Also, don't forget to put this 
    in your package.json to ensure 
    nodemon runs smoothly:"
echo '*"nodemonConfig": { 
        "ignore": [
         "sessions/*"]*'

echo "To start the app, just navigate to 
    where you want your new app to live
    and type createExpressApp.sh"
echo "********************************"
echo "********************************"
