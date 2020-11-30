# Kevin Skoglund: Installing and Running Ruby on Rails 6

## Chapter 2: Windows Installation

### Enable Windows subsystem for Linux

- enable windows subsystem for Linux in Control Panel > Programs and Features

### Install Linux on Windows

- install ubuntu cli app from Microsoft Store
- Ubuntu will ask you to create username and password for user
- update the software
    - `sudo apt update`
- upgrade the software
    - `sudo apt upgrade`
- install software
    - `sudo apt install build-essential git-core curl libssl-dev libreadline-dev libxml2-dev libsqlite3-dev sqlite3 librri-dev zlib1g-dev libxslt1-dev libcul4-openssl-dev software-properties-common`

#### install rbenv

- retrieve and install rbenv
    - `curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-installer | bash`
- add rbenv to PATH
    - `nano .bashrc`
    - goto bottom of file and add these lines: 
        - `export PATH="$HOME/.rbenv/bin:$PATH"`
        - `eval "$(rbenv init -)"`
- initialize the newly added lines
    - `source .bashrc`
- verify by locating the rbenv executable
    - `which rbenv`

#### install ruby

- get list of available ruby versions
    - `rbenv install --list`
- install specific ruby version
    - `rbenv install 2.7.2`
- see what versions are installed    
    - `rbenv versions`
- make a version active
    - `rbenv global 2.7.2`
- verify ruby is installed by getting version number
    - `ruby -v`
- verify gem is installed by getting version number
    - `gem -v`

### Install Ruby on Rails for a Rails project

- install latest version of rails
    - `gem install rails`
- tell rbenv that something was just installed
    - `rbenv rehash`
- verify rails is installed by getting version number
    - `rails -v`

#### Install MYSQL

- install mysql and related libraries
    - `sudo apt install mysql-server mysql-client libmysqlclient-dev`
- verify is mysql is running
    - `sudo service mysql status`
- if it is stopped, start it
    - `sudo service mysql start`
- secure installation
    - `sudo mysql_secure_installation`
    - answer questions to your preferences
- set password in mysql (again) DUE TO A BUG?
    - `sudo mysql -u root`
    - select the mysql table
        - `USE mysql`
        - update User so root uses mysql_native_password like other users
            - `UPDATE user SET plugin='mysql_native_password';`
        - reload everything and quit
            - `FLUSH PRIVILEGES;`
            - `quit`
- verify password works
    - `mysql -u root -p`
    
- if needed, remove and reinstall mysql
    - `sudo apt purge mysql-server mysql-client mysql-common`
    - `sudo apt autoremove`
    - `sudo mv -iv /var/lib/mysql /var/tmp/mysql-backup`
    - `sudo rm -rf /var/lib/mysql*`
    - `sudo apt update`
    - `sudo apt install mysql-server mysql-client libmysqlclient-dev`
    - `mysqld --initialize`
    - `sudo /usr/bin/mysql_secure_installation`
    
### Install MYSQL Ruby gems

- install mysql gem
    - `gem install mysql2`

### Install JavaScript Tools

- setup a personal package archive for NodeJS (use NodeJS with ROR)
    - `curl -sL https://deb.nodesource.com./setup_14.x | sudo -E bash -`
        - NodeJS LTS version is 14.x at this time
- install nodejs and other suggested dev tools
    - `sudo apt install -y nodejs`
    - `sudo apt install gcc g++ make`
- install yarn (manages javascript packages)
    - `curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -`
    - `echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list`
    - `sudo apt update`
    - `sudo apt install yarn`
   
## Chapter 3: Rum Ruby on Rails
    
### Create a New Ruby on Rails Project, Configure the Project to use a Database

- create a directory (e.g., Sites) and go into it
    - `mkdir Sites`
    - `cd Sites`
- start a rails project (using MYSQL)
    - `rails new demo_project -d mysql`
- configure database
    - `sudo mysql -u root -p`
    - create databases
        - `CREATE DATABASE demo_project_development;`
        - `CREATE DATABASE demo_project_test;`
    - create user and enable privileges (username and password is up to you)
        - `CREATE USER 'demo_project_user'@'localhost' IDENTIFIED BY 'password';`
        - `GRANT ALL PRIVILEGES ON demo_project_development.* TO 'demo_project_user'@'localhost';`
        - `GRANT ALL PRIVILEGES ON demo_project_test.* TO 'demo_project_user'@'localhost';`
    - `quit`
- update rails config file
    - file path home/<username>/Sites/demo_project/config/database.yml
    - change username from `root` to `demo_project_user`
    - change password from ` ` to `demo_project_password`
- in Ubuntu, make sure you are in the demo_project directory
    - path: `home/<username>/Sites/demo_project/`
        - use `pwd` if you don't know where you are
    - `rails db:schema:dump`
    - `bundle install`
    
### Launch a Ruby on Rails project
    
- launch project
    - `rails server`
    - view in browser
        - url: `localhost:3000`