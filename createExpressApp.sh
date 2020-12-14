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
mkdir $ProjectName/public $ProjectName/view $ProjectName/models $ProjectName/routes $ProjectName/public/stylesheets
touch $ProjectName/app.js $ProjectName/readMe.md
touch $ProjectName/public/stylesheets/style.css


# #Protect node_modules in .gitignore
echo "***********************************"
echo "*Adding node_modules to .gitignore*"
echo "***********************************"
echo node_modules >> $ProjectName/.gitignore

echo "*******************************"
echo "********Creating app.js********"
echo "*******************************"


echo "const http = require('http');
const hostname = '127.0.0.1';
const express = require('express');
const morgan = require('morgan');
const logger = morgan('tiny');
const app = express();
app.use(logger);
app.use(express.urlencoded({ extended: true }));

app.use(express.static('public'));

const es6Renderer = require('express-es6-template-engine');
app.engine('html', es6Renderer);
app.set('views', 'templates');
app.set('view engine', 'html');

const server = http.createServer(app);
app.get('/', (req, res) =>{
    res.send('Hello, world!')
});

server.listen($PORT, hostname, () => {
    console.log('Server running at localhost, port $PORT');
});
" >> $ProjectName/app.js

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

npm install --save-dev nodemon --prefix $ProjectName

echo "*********************************"
echo "***Installing Standard Packages**"
echo "*********************************"

npm install --prefix $ProjectName

echo "*********************************"
echo "*installing es6-template-engine**"
echo "*********************************"


npm install express-es6-template-engine --prefix $ProjectName


echo "You're ready to go. Nodemon has
been installed, but you'll need to 
add it to your scripts and dev 
dependencies in package.json."








