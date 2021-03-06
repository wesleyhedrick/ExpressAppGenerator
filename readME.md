# Express App Generator (Mac)

## This is a shell script that will scaffold a basic Express app. 
By 'scaffold,' I mean that it will do the following.

    1. It makes these directories:
        - Project directory based on name you input
        - Views
        - Models
        - Public
        - Routes
        - Config

    2. It creates these files:
        - app.js
          - app.js is provisioned with everything needed for basic server function.
            -  http, express, morgan, nodemon, and all modules that get installed with 
               'npm install'.
            - express-es6-template-engine is set up and configured.
        - style.css
        - .env
        - .sequelizerc
    3. It initializes the project folder with npm init -y.
    4. It protects node_modules, .env, and sessions in .gitignore.
    5. It installs the following modules: express, helmet, sequelize, sequelize-cli, pg, 
       pg-hstore, path, bcryptjs, morgan, express-session, session-file-store, nodemon.
    6. It sets up one route with a canned response. 

While there are other helpful Express App generators available (Have your mind blown by checking into [this](https://code.visualstudio.com/docs/nodejs/nodejs-tutorial#_an-Express-application)), this script builds all the basics and uses es6-templates instead of [pug](pugjs.org). 

How to Use It (Works on Mac Only)
1. Download the folder. 
2. From inside the folder, use your shell to run installExpressAppGenerator.sh.
    Ex: zsh installExpressAppGenerator.sh
    or
    Ex: bash installExpressAppGenerator.sh
3. The install is quick, after which you should be able to create a new Express app anywhere by typing `createExpressApp.sh`. 
