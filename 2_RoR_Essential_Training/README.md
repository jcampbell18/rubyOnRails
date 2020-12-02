| Repository Links |
| :--------------- |
| [Ruby on Rails](https://github.com/jcampbell18/rubyOnRails) |
| &#8594; [Ruby on Rails: Installation and Running Ruby on Rails 6](https://github.com/jcampbell18/rubyOnRails/tree/main/1_Installing_Setup) |
| &#8594; [Ruby on Rails: Controllers and Views](https://github.com/jcampbell18/rubyOnRails/tree/main/3_RoR_Controllers_Views) |
| &#8594; [Ruby on Rails: Models and Associations](https://github.com/jcampbell18/rubyOnRails/tree/main/4_RoR_Models_Associations) |
| [Ruby](https://github.com/jcampbell18/rubyOnRails/tree/main/ruby) |
| &#8594; [Ruby Essential Training 1](https://github.com/jcampbell18/rubyOnRails/tree/main/ruby/1_The_Basics) |
| &#8594; [Ruby Essential Training 2](https://github.com/jcampbell18/rubyOnRails/tree/main/ruby/2_EssentialTraining) |
| &#8594; [Ruby Essential Training 3](https://github.com/jcampbell18/rubyOnRails/tree/main/ruby/3_EssentialTraining) |
| [Projects](https://github.com/jcampbell18/rubyOnRails/tree/main/projects) |
| &#8594; [Demo Project](https://github.com/jcampbell18/rubyOnRails/tree/main/projects) |
| &#8594; [Simple CMS](https://github.com/jcampbell18/rubyOnRails/tree/main/projects) |

# Kevin Skoglund: Ruby on Rails 6 - Essential Training

## Chapter 2: Get Started with Ruby on Rails

### Create a new Ruby on Rails project

- rails new project_name -option option_name
    - `rails new simple_cms -d mysql`
    
### Configure a Ruby on Rails project

- see [Ruby on Rails: Installation and Running Ruby on Rails 6](https://github.com/jcampbell18/rubyOnRails/tree/main/1_Installing_Setup) to setup table and user
-  in the path `/simple_cms/config/database.yml`, update username and password to reflect the database for the project

### Generate a controller and view

- rails generate controller ControllerName ViewName
    - `rails generate controller Demo index`

# Commands

### Controller, View

- rails generate controller <ControllerName> <viewName>
    - `rails generate controller Demo index`
	
### Model

- rails generate model `TableName` `column:property`
	- `rails generate model Page name:string position:integer visible:boolean`
	
### Migration

- up or create
	- `rails db:migrate`
- down or delete
	- `rails db:migrate VERSION=0`
	
### Rails Console

- you must be in root directory of project (/home/`username`/Sites/`projectName`
	- `rails console` or `rails c`
- or choose specific environment
	- `rails console -e development`
	- `rails console -e test`
	
### URL Helpers

- ![screenshot](https://github.com/jcampbell18/rubyOnRails/blob/main/2_RoR_Essential_Training/READMEscreenshots/Screenshot%202020-11-18%20134522.png)