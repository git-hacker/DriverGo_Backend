# README

This is the rails backend for DriverGo.

To set up you need:

- ruby 2.4.4
- bundler installed within that ruby (`gem install bundler`)
- Postgresql (`brew install postgresql`)
- Postgis (`brew install postgis`)
Then go into this project and run

`bundle install`

Then

`bin/rails db:create db:migrate`

and start server with

`bin/rails s -p 3000`

