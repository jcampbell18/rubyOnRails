| Repository Links |
| :--------------- |
| [Ruby on Rails](https://github.com/jcampbell18/rubyOnRails) |
| &#8594; [Installation and Running Ruby on Rails 6](https://github.com/jcampbell18/rubyOnRails/tree/main/1_Installing_Setup) |
| &#8594; [Ruby on Rails 6: Essential Training](https://github.com/jcampbell18/rubyOnRails/tree/main/2_RoR_Essential_Training) |
| &#8594; [Ruby on Rails 6: Controllers and Views](https://github.com/jcampbell18/rubyOnRails/tree/main/3_RoR_Controllers_Views) |
| &#8594; [Ruby on Rails 6: Models and Associations](https://github.com/jcampbell18/rubyOnRails/tree/main/4_RoR_Models_Associations) |
| [Ruby](https://github.com/jcampbell18/rubyOnRails/tree/main/ruby) |
| &#8594; [Ruby Essential Training 1](https://github.com/jcampbell18/rubyOnRails/tree/main/ruby/1_The_Basics) |
| &#8594; [Ruby Essential Training 2](https://github.com/jcampbell18/rubyOnRails/tree/main/ruby/2_EssentialTraining) |
| &#8594; [Ruby Essential Training 3](https://github.com/jcampbell18/rubyOnRails/tree/main/ruby/3_EssentialTraining) |
| [Projects](https://github.com/jcampbell18/rubyOnRails/tree/main/projects) |
| &#8594; Demo Project |
| &#8594; Simple CMS |
| &#8594; Invoicing System |

# Projects

## Demo Project

- from Kevin Skoglund's Installing and Running Ruby on Rails 6
- just a simple startup
     
## Simple CMS 

- from Kevin Skoglund's Ruby on Rails 6: Essential Training
- implements CRUD
    
## Invoicing System

- converting an old project to Ruby on Rails for Two Barrels

### Steps taken to create project

#### MYSQL Database

- imported pre-written (and updated) scripts called [structure.sql](https://github.com/jcampbell18/rubyOnRails/blob/main/structure.sql) and `data.sql`
    - ![screenshot](https://github.com/jcampbell18/rubyOnRails/blob/main/projects/READMEscreenshots/Screenshot%202020-12-01%20182648.png)
- created a user and password for the database
    - ![screenshot](https://github.com/jcampbell18/rubyOnRails/blob/main/projects/READMEscreenshots/Screenshot%202020-12-01%20183101.png)
- created the rails project
    - `rails new invoicing -d mysql`
