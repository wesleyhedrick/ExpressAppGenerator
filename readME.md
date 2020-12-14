# Express App Generator

## This is a shell script that will scaffold a basic Express app. 
By 'scaffold,' I mean that it will do the following:<br>

    –It makes these directories:
        - Project directory based on name you input
        - Views
        Models
        Public
        Routes
        
    - It creates these files:
        app.js
        - app.js is provisioned with everything needed for basic server function.
            -  http, express, morgan, nodemon, and all modules that get installed with 
              'npm install'.
            - express-es6-template-engine is set up and configured.
        style.css
    - It initializes the project folder with npm init -y.
    - It sets up one route with the response 'Hello, world!'

While there are other helpful express App generators available (Have your mind blown by checking into [this](https://code.visualstudio.com/docs/nodejs/nodejs-tutorial#_an-express-application)), this express app builds all the basic and uses es6-templates instead of pug. 

How to Use It
1. Download the folder. 
2. From inside the folder, use your shell run installExpressAppGenerator.sh.
    Ex: zsh installExpressAppGenerator.sh
    or
    Ex: bash installExpressAppGenerator.sh
3. The install is quick, after which you should be able to create a new Express app anywhere by typing `createExpressApp.sh`. 
