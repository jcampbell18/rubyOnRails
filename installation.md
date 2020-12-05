# Installation for Ruby on Rails

[x] Ruby Version: 2.7.2

[x] Rails Version: 6.0.3.4

| Links |
| :--- |
| [Ubuntu](https://github.com/jcampbell18/rubyOnRails/blob/main/installation.md#ubuntu-2004lts-focal-fossa) |
| [Windows 10](https://github.com/jcampbell18/rubyOnRails/blob/main/installation.md#windows-10) |
| [References](https://github.com/jcampbell18/rubyOnRails/blob/main/installation.md#references) |

## Ubuntu 20.04LTS (Focal Fossa)

### Ruby

1. Make sure everything is up to date
	1. `sudo apt update`
2. Install curl
	1.`sudo apt install curl`
3. add NodeJS and Yarn repositories
	1. `curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -`
	2. `curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -`
	3. `echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list`
6. Make sure everything is up to date
	1. `sudo apt update`
7. Install dependencies needed for ruby and rails
	1. `sudo apt-get install git-core zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev software-properties-common libffi-dev nodejs yarn`

#### Rbenv

8. Install rbenv
	1. `git clone https://github.com/rbenv/rbenv.git ~/.rbenv`
	2. `echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc`
	3. `echo 'eval "$(rbenv init -)"' >> ~/.bashrc`
	4. `exec $SHELL`
9. Install ruby-build
	1. `git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build`
	2. `echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc`
	3. `exec $SHELL`
10. Install ruby
	1. `rbenv install 2.7.2`
11. Set version of ruby as default
	2. `rbenv global 2.7.2`
12. Verify ruby installation
	3. `ruby -v`

### Rails

13. Install Bundler
	1. `gem install bundler`
14. Install Rails
	1. `gem install rails -v 6.0.3.4`
15. Make rails executable
	1. `rbenv rehash`
16. Verify rails installation
	1. `rails -v`
	
### Optional Installation/Configurations

#### MYSQL Database

1. `sudo apt-get install mysql-server mysql-client libmysqlclient-dev`	
	
#### Git (optional)

JetBrain's RubyMine IDE has built-in Git tools, so these steps are not needed

1. If you already have Github account...configure it on your system
	1. `git config --global color.ui true`
	2. `git config --global user.name "YOUR NAME"`
	3. `git config --global user.email "YOUR@EMAIL.com"`
2. Generate SSH key
	1. `ssh-keygen -t rsa -b 4096 -C "YOUR@EMAIL.com"`
		1. Unless you know what you are doing, just hit enter through the questions to get default
3. View SSH key
	2. `cat ~/.ssh/id_rsa.pub`
		1. Copy this key
4. Paste into your GitHub account under Profile -> Settings -> SSH and GPG keys

## Windows 10

### Windows Subsystem for Linux

1. Enable Windows subsystem for Linux
	1. Control Panel -> Programs and Features
	2. Click "Turn Windows features on or off" link
	3. Check the box labeled "Windows Subsystem for Linux"
2. Install Ubuntu 20.04 from the Microsoft Store
3. Ubuntu will ask you to create username and password for user on initialization

### Dependencies

4. Update the software
	1. `sudo apt update`
5. Upgrade the software
	1. `sudo apt upgrade`
6. Install dependencies
	1. `sudo apt install build-essential git-core curl libssl-dev libreadline-dev libxml2-dev libsqlite3-dev sqlite3 librri-dev zlib1g-dev libxslt1-dev libcul4-openssl-dev software-properties-common`
	
### Rbenv

7. Install rbenv
	1. `curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-installer | bash`
		1. A warning will appear that rbenv is installed but not present in PATH
8. Add rbenv to PATH
	1. Open/Edit file
		1. `nano .bashrc`
			1. At the bottom of the file, add these lines:
				1. `export PATH="$HOME/.rbenv/bin:$PATH"`
				2. `eval "$(rbenv init -)"`
	2. Initialize the newly added lines
		1. `source .bashrc`
	3. Verifiy rbenv installation
		1. `which rbenv`
		
### Ruby

9. Get list of available Ruby versions
	1. `rbenv install --list`
10. Install Ruby 2.7.2
	1. `rbenv install 2.7.2`
11. Set version of ruby as default
	1. `rbenv global 2.7.2`
12. Verify ruby installation
	1. `ruby -v`
13. Verify ruby installation
	1. `gem -v`
	
### Rails

14. Install latest version of rails
	1. `gem install rails`
15. Make rails executable
	1. `rbenv rehash`
16. Verify rails installation
	1. `rails -v`
	
### JavaScript Tools

1. Setup a personal package archive for NodeJS (use NodeJS with ROR)
	1. `curl -sL https://deb.nodesource.com./setup_14.x | sudo -E bash -`
		1. NodeJS LTS version is 14.x at this time
2. Install nodejs and other suggested dev tools
	1. `sudo apt install -y nodejs`
	2. `sudo apt install gcc g++ make`
3. Install yarn (manages javascript packages)
	1. `curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -`
	2. `echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list`
	3. `sudo apt update`
	4. `sudo apt install yarn`
	
### Optional Installation/Configurations

#### MYSQL Database

1. Install mysql and related libraries
	1. `sudo apt install mysql-server mysql-client libmysqlclient-dev`
2. Verify is mysql is running
	1. `sudo service mysql status`
		1. If it is stopped, then start it
			1. `sudo service mysql start`
3. Secure installation
	1. `sudo mysql_secure_installation`
		1. Answer questions to your specifications
4. Due to a bug, the password will need to be set again
	1. `sudo mysql -u root`
		1. Select the mysql table
			1. `USE mysql`
		2. Update User so root uses mysql_native_password like other users
			1. `UPDATE user SET plugin='mysql_native_password';`
		3. Reload everything and quit
			1. `FLUSH PRIVILEGES;`
			2. `quit`
5. verify password works
	1. `mysql -u root -p`
		1. If it does not, try these steps
			`sudo apt purge mysql-server mysql-client mysql-common`
			`sudo apt autoremove`
			`sudo mv -iv /var/lib/mysql /var/tmp/mysql-backup`
			`sudo rm -rf /var/lib/mysql*`
			`sudo apt update`
			`sudo apt install mysql-server mysql-client libmysqlclient-dev`
			`mysqld --initialize`
			`sudo /usr/bin/mysql_secure_installation`
6. Install MYSQL gem
	1. `gem install mysql2`
	
## References

- [Go Rails Guide](https://gorails.com/setup/ubuntu/20.04)

- [Kevin Skoglund: Installing and Running Ruby on Rails 6](https://www.linkedin.com/learning/installing-and-running-ruby-on-rails-6/)
