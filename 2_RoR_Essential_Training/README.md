link |
---- |
[Ruby on Rails](https://github.com/jcampbell18/rubyOnRails) |
[Ruby on Rails: Installation and Running Ruby on Rails 6](https://github.com/jcampbell18/rubyOnRails/tree/main/1_Installing_Setup) |
[Ruby on Rails: Controllers and Views](https://github.com/jcampbell18/rubyOnRails/tree/main/3_RoR_Controllers_Views) |
[Ruby on Rails: Models and Associations](https://github.com/jcampbell18/rubyOnRails/tree/main/4_RoR_Models_Associations) |
[Ruby](https://github.com/jcampbell18/rubyOnRails/tree/main/ruby) |

# Kevin Skoglund: Ruby on Rails 6 - Essential Training

## Chapter 2: Get Started with Ruby on Rails

- create the project
    - rails new project_name -option option_name
        - `rails new simple_cms -d mysql`

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

- ![screenshot](https://github.com/jcampbell18/rubyOnRails/blob/main/READMEscreenshots/Screenshot%202020-11-18%20134522.png)