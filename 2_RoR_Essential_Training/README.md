link |
---- |
[Installation/Setup](https://github.com/jcampbell18/rubyOnRails/tree/main/ruby/1_The_Basics) |
[Controllers/Views](https://github.com/jcampbell18/rubyOnRails/tree/main/ruby/3_EssentialTraining) |
[Models/Associations](https://github.com/jcampbell18/rubyOnRails/tree/main/ruby/3_EssentialTraining) |
[ruby](https://github.com/jcampbell18/rubyOnRails/tree/main/ruby) |
[Ruby on Rails](https://github.com/jcampbell18/rubyOnRails) |

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