# Kevin Skoglund: Ruby on Rails 6 - Essential Training

## Commands

### Controller, View

- rails generate controller <ControllerName> <viewName>
    - `rails generate controller Demo index`
	
### Model

- rails generate model <TableName> <column:property>
	- `rails generate model Page name:string position:integer visible:boolean`
	
### Migration

- up or create
	- `rails db:migrate`
- down or delete
	- `rails db:migrate VERSION=0`
	
### Rails Console

- you must be in root directory of project (/home/<username>/Sites/<projectName>
	- `rails console` or `rails c`
- or choose specific environment
	- `rails console -e development`
	- `rails console -e test`