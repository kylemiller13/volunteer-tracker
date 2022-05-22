# Volunteer Tracker

#### By Kyle Miller

#### This is a web application that tracks prokects and the volunteers working on them. 

## Technologies Used

* Ruby
* Ruby Gems: Rspec, Pry, Sinatra, Sintara-Contrib, Capybara, pg
* HTML
* Postgres
* SQL 

## Description:
_This application was created to demonstrate my understanding of CRUD functionality, routes using Sinatra with RESTful conventions, creating database with PostgreSQL, and testing with Capybara. The user can update, and delete a project and add volunteers to a project._

## User Stories

* As a non-profit employee, I want to view, add, update, and delete projects.
* As a non-profit employee, I want to view and add volunteers.
* As a non-profit employee, I want to add volunteers to a project. 

## Setup/Installation Requirements for Windows

* Install _[PostgreSQL](https://www.postgresql.org/docs/current/tutorial-install.html)_
* Clone or download this repository onto your desktop.
* Navigate to the top-level of directory.
* Open VScode.
* Type "bundle" to install the gems
* Create a `.gitignore` & `db_access.rb` file in the root directory.
* In `.gitignore` file, write `db_access.rb`.
* Git add `.gitignore` file.
* In `db_access.rb` file, write `DB = PG.connect({:dbname => 'dbname', :password => 'password'})` replacing dbname & password with your dbname & password for PostgreSQL.
* **To Run Tests**: In the root directory of this project, run `rspec` in your command line.
* **To Run the App in Browser**: In the root directory of the project, run `pg_ctl start` in the terminal to run a server. Then run `ruby app.rb` in the terminal. This will start a server, which you can access by entering `localhost:4567` in your browser.

## Database Setup (_Type in terminal_)

* Connect to PSQL
```
psql
```
* Create a Database 
```
CREATE DATABASE dbname;
```
* Connect to Database
```
\c dbname;
```
* Create tables 
```
CREATE TABLE dbname (id serial PRIMARY KEY, title varchar);
CREATE TABLE dbname (id serial PRIMARY KEY, name varchar, project_id int);
```
## Known Bugs

- _N/A_

## License

- N/A Copyright (c) 4/24/2022, Kyle Miller
- _[MIT](https://opensource.org/licenses/MIT)_