# ElectronTodoApp
An Electron TodoApp or Note Taking Application. Create and Archive Notes in this application designed to be deployed for Linux, Mac, and Windows.

Website version of this app found [here](https://github.com/jaylenw/AngularJsTodoApp).
Android version of this app is in development [here](https://github.com/jaylenw/IonicTodoApp).

##Description

Users are able to use this App as a Todo-List or a Note Taking application.

##Features

* User Login, Logout, & Registration
* Add, Edit, Delete, and Archive Notes
* Supports Markdown

## Build, Testing, & Development

1. Need to have [Nodejs](https://nodejs.org/en/), [NPM](https://www.npmjs.com/), [Grunt](http://gruntjs.com/), and [Bower](https://bower.io/) installed on your system globally. This guide assumes you are running a 16.04 LTS 64bit Ubuntu system. If running a Debian/Ubuntu system and you do not have the packages installed globally, run these commands below:

        sudo apt update  
        sudo apt install nodejs  
        sudo ln -s /usr/bin/nodejs /usr/bin/node  
        sudo apt install npm
        sudo npm install -g npm
        sudo dpkg --add-architecture i386
        sudo add-apt-repository ppa:wine/wine-builds
        sudo apt-get update
        sudo apt-get install --install-recommends winehq-devel
        
  If you prefer to use the Staging branch, replace `winehq-devel` with `winehq-staging` in the line above.
        

2. Clone this repo.

3. In the root of the project folder, run `npm install`.

4. Run `npm start` or `./node_modules/.bin/electron .` for live preview. You can navigate throught the app. Note, if for
some reason you are seeing a black screen or any sort of artifacts, try running `./node_modules/.bin/electron . --disable-gpu`.


Note: You will not be able to register or login with an account until the backend is setup correctly.

## Deploying as a Desktop Application

Assuming you have ran the above commands, simple run `npm run build`. This will take some time but it will produce 32bit and 64bit binaries for Linux (also ARM but only for Linux), Mac, and Windows in folders found in the folder called `dist` once the build is complete. For the respective platform, navigate to the folder and run the binary like any other application. Note, if for some reason you are seeing a black screen or any sort of artifacts, try running the binary in the command line with this appended to the end `--disable-gpu`.


### Setting up the Backend

Note: Change the javascript file in /www/js/services/, config.js,  to have your url and port number
   that will be directing requests to your backend for the `_apiUrl` variable. Do not change anything after the port number. Forever (server we will be using) by defualt listens to port 3000. Replace "yourdomain.com" with the domain you will be using. It will look like this, "http://yourdomain.com/3000"

1. The backend for this app is found here at this repo: https://github.com/jaylenw/ToDoBackend

2. To run the backend, first clone the repo above. Second, install forever from npm globally, `npm install forever -g`. You may    need to run `sudo npm install forever -g` if on Ubuntu/Debian.
   You can use [forever](https://www.npmjs.com/package/forever) to run the backend server and autorestart it.

3. Next, install mongodb on your system globally and have it running. If on a Ubuntu/Debian system, you would run
   `sudo apt-get install mongodb`.

4. After having cloned the repo linked above and are in the root of the folder, run `npm install && bower install`.

5. Use forever to start the server, run `forever start bin/www`.

6. You should now be able to get and post tasks to the server after registering an account through your site.

7. If you need to kill `forever` for any reasons, run `forever list`. You will then see a list of all `forever` processes. Kill the `forever` process you want
by identifying the `pid` and killing it by running `forever stop pidNUM` where pidNUM is the pid number is the process you would like to kill.

--------------------------------------------------------------------------------------------------------------

Pull requests and issues are welcomed.
