# README

| Table         | Column        | Datatype |
| ------------- |:-------------:| -----:   |
|               | id            | integer  |
|users          | name          |  string  |
|               | email         |  string  |
|               | password      |  string  |
|               | timestamps    |  date    |


| Table         | Column        | Datatype |
| ------------- |:-------------:| -----:   |
|               | id            |  integer |
|   profiles    | image         |  text    |
|               | user_id       |  integer |


| Table         | Column        | Datatype |
| ------------- |:-------------:| -----:   |
|               | id            |  integer |
|               | title         |  string  |
|tasks          | content       |  text    |
|               | user_id       |  string  |



#Deploy on heroku

1.Install heroku on your
2.Create account on heroku 
3.Login 
4.create an application on heroku with 
##heroku create

5.Remote the application ypu created
6.push the aplication you created with
## git push heroku master
7.Migrate heroku db with
##heroku run rake:db migrate
