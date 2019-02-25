# Moodvies

An application which serves information about movies from the server to the client.

#### Content:
* [Technology Stack](#tech-stack)
* [Detailed Description](#det-desc)
* [Issues-Needs](#issues)
* [Installation Instructions](#install)
    * [Windows](#win)
    * [Linux](#linux)
* [Live Exaple](#example)

## <a name="tech-stack"></a>Technology Stack

* [Angular Web Framework](https://angular.io/)  Used for the frontend handling
  * angular-devkit/core              7.2.4
  * angular-devkit/schematics        7.0.7
  * angular/cli                      7.0.7
  * ngtools/webpack                  7.2.4
  * [rxjs](https://www.learnrxjs.io/) 6.4.0
  * [Typescript](https://www.typescriptlang.org/)                        3.1.6
  
* [Django Web Framework (2.1.2)](https://www.djangoproject.com/) used for the backend handling
    * [Django Rest Framework](https://www.django-rest-framework.org/)
    * [JWT Auth](https://jwt.io/)
    * [Python 3.6.4](https://www.python.org/)
    
 * [MySQL 8.0.12](https://www.mysql.com/) used as database

## <a name="det-desc"></a>Detailed Description

Moodvies is a cloud application created to help users find a suitable movie to watch based on the mood 
they want to get (example cheerful mood). The application's backend is being handled by [Django Web Framework](https://www.djangoproject.com/)
 with [DRF(Django Rest Framework)](https://www.django-rest-framework.org/). DRF is responsible for 
 receiving requests and sending responses in [json](https://www.json.org/) format to the frontend of the application
 using [DRF serializers](https://www.django-rest-framework.org/api-guide/serializers/).
 

 The services in this application  allow users to:
* Search a movie, an actor, a director  and access information about the subject
* Find movies connected to the mood, director, actor selected. 
* Find movies sorted by imdb or moodvies rating.
* Create an account.
* Create a review about a specific movie.
* Delete a review created from the user.
* Update account information.
* Rate a specific movie.
* Create a movie list.
* Access other people's movie lists
* Delete a movie-list created from the user.

Furthermore the application also has validations in the backend for every field posted and notifies the 
user for errors via the error handling service (checking what type of error is it) and the 
message service (displaying error to user.

The authentication is being controlled
with json web tokens. Whenever a user logs in, a token is being created and expires 1 day after its creation.
The frontend saves the token to the localstorage and the token.interceptor.json sets the authentication header
for every request the user makes to the server. The token is being refreshed every time the user changes routes
and the refresh expiration date is 7 days after the token creation. If a token expires and cannot be refreshed,
the user is being redirected to the login page with the proper message printed in his/her screen.

There is also a service which posts the ip address of the user to the server and every time
a specific actor, director or movie is being visited, the ip address is saved to the subject (unique ip address in every object).
 That way, every time a user goes to all movies, actors, directors, or even search  movies, actors, directors
 the result list is being sorted and the first result will be the one with the most ip address visits.

# <a name="issues"></a>Issues-Needs
There are plenty of things in this application that need more attention and work. Many parts of the codes 
could be updated for better performance and user experience. I couldn't find any issues that stop the app from
running or messing with moodvies basic functionality but i found some issues that need attention:
* Css for mobiles is incomplete 
* Register form validation needs to be updated for dynamic validation
* Search components needs ngx-loading implementation
* Error handling service and messages need a big upgrade in the way it functions

# <a name="install"></a>Installation instructions
You can download and run the application moodvies in your local machine following the steps above. Note 
that in order for you to have a smoother user experience in your local machine and check how the app
is showing data you have to download the static files (uploads.rar) and also run the dump query to your database.

## <a name="win"></a>For Windows
### Windows(1) Install MySQL Server
Download and install MySQL server running the [MySQL installer for windows](https://dev.mysql.com/downloads/installer/)
You can also have an easier experience using [MySQL Workbench](https://www.mysql.com/products/workbench/) providing UI support.


### Windows(2) Install Python
The first thing you need to do is to install [python 3 for windows](https://www.python.org/downloads/windows/).
Remember to configure the environment variables properly.

### Windows(3) Download Project and activate virtual environment
Download [moodvies project](https://github.com/thanos-pakou/moodvies) from github or clone it to your
local machine by typing to Command Prompt:
```
git clone https://github.com/thanos-pakou/moodvies.git
```
Then in the Command Prompt navigate to the moodvies directory and install virtual environment 
```
pip install virtualenvwrapper-win
```
and then 
```
mkvirtualenv env
```
and 
```
workon env
```

### Windows(4) Install DRF and django-rest-framework-jwt
First type
```
pip install djangorestframework
```
and then 
```
pip install djangorestframework-jwt
```

### Windows(5) Install npm modules
in the command prompt navigate to the moodvies/client and then type
```
npm install
```

### Windows(6) Create Database
open mysql and run the following query
```
CREATE DATABASE moodvies CHARACTER SET utf8 COLLATE utf8_general_ci;

CREATE USER 'moodvies_user'@'localhost' IDENTIFIED BY 'moodvies';

GRANT ALL PRIVILEGES ON moodvies.* TO 'moodvies_user'@'localhost';

FLUSH PRIVILEGES;
```

### Windows(7) Migrate
navigate to moodvies/server and run
```
python manage.py migrate
```

### Windows(8) Load data to database
Navigate to moodvies and unzip the uploads.rar file to moodvies/server.
After that run the queries from moodvies-test-data.sql to your MySQL Server.

When finished you are almost ready to go.

### Windows(9) Create site_config.py
Navigate to moodvies/server/moodvies_project and create the file <b>site_config.py</b>

####site_config.py
```
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'moodvies',
        'USER': 'moodvies_user',
        'PASSWORD': 'moodvies',
        'HOST': '127.0.0.1',
        'OPTIONS': {
            'isolation_level': 'read committed'
        }
    }
}

# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = '#8q_atktq(^$9qdq$j3u20f956von-oo&gj_*nz*#!x=2g$&b%'
```

### Windows(10) Run application
You need to run 2 applications from 2 different Command Prompts. Open command prompt, navigate to
moodvies/client and run
```
ng serve
```
Then open another command prompt, navigate to moodvies/server and run 
```
python manage.py runserver
```

If everything goes well you will be able to access the application in this link

[http://localhost:4200](http://localhost:4200)

You can use the test account: <b>Username: test -- Password: test1234</b>
<br>
 or the admin account: <b>Username: moodvies -- Password: moodvies</b>

## <a name="linux"></a>For Linux

### Linux(1) Install MySQL package
To install MySQL package type in command prompt 
```
sudo apt-get install mysql-server
```

### Linux(2) Install Python
To install python just run 
```
sudo apt-get install python3
```

### Linux(3) Download Project and activate virtual environment
Download [moodvies project](https://github.com/thanos-pakou/moodvies) from github or clone it to your
local machine by typing to Command Prompt:
```
git clone https://github.com/thanos-pakou/moodvies.git
```
then navigate to the project directory aka moodvies and to install the virtual environment package run
```
sudo -H pip3 install virtualenv
```
and then to create a vm to your project run
```
virtualenv env
```
and to activate it run
```
source env/bin/activate
```

### Linux(4) Install DRF and django-rest-framework-jwt
First type
```
pip install djangorestframework
```
and then 
```
pip install djangorestframework-jwt
```

### Linux(5) Install npm modules
in the command prompt navigate to the moodvies/client and then run
```
npm install
```

### Linux(6) Create Database
To connect to mysql run 
```
mysql -u root -p
```
and then run the following query
```
CREATE DATABASE moodvies CHARACTER SET utf8 COLLATE utf8_general_ci;

CREATE USER 'moodvies_user'@'localhost' IDENTIFIED BY 'moodvies';

GRANT ALL PRIVILEGES ON moodvies.* TO 'moodvies_user'@'localhost';

FLUSH PRIVILEGES;
```

### Linux(7) Migrate
navigate to moodvies/server and run
```
python manage.py migrate
```

### Linux(8) Load data to database
Navigate to moodvies and unzip the uploads.rar file to moodvies/server.
After that run the queries from moodvies-test-data.sql to mysql.

When finished you are almost ready to go.

### Linux(9) Create site_config.py
Navigate to moodvies/server/moodvies_project and create the file <b>site_config.py</b>

####site_config.py
```
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'moodvies',
        'USER': 'moodvies_user',
        'PASSWORD': 'moodvies',
        'HOST': '127.0.0.1',
        'OPTIONS': {
            'isolation_level': 'read committed'
        }
    }
}

# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = '#8q_atktq(^$9qdq$j3u20f956von-oo&gj_*nz*#!x=2g$&b%'
# This is a random security key
```

### Linux(10) Run application
You need to run 2 applications from 2 different Command Prompts. Open command prompt, navigate to
moodvies/client and run
```
ng serve
```
Then open another command prompt, navigate to moodvies/server and run 
```
python manage.py runserver
```

If everything goes well you will be able to access the application in this link

[http://localhost:4200](http://localhost:4200)

You can use the test account: <b>Username: test -- Password: test1234</b>
<br>
 or the admin account: <b>Username: moodvies -- Password: moodvies</b>

# <a name="example"></a>Live Example 
Moodvies app was uploaded in a virtual machine hosted by [okeanos](https://okeanos.grnet.gr).

The application can be reached in this link: [Moodvies Website](https://snf-856718.vm.okeanos.grnet.gr/)
The setup has been made with:
* [Nginx](https://www.nginx.com/) for the static files 
* [Gunicorn](https://gunicorn.org/)

