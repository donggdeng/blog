## Project Description/Summary

This project implements a basic CRUD and search feature for blogs.

## Ruby version

3.0.2

## Nodejs version

16.12.0

## Tasks to run for setting up

You need to create and migrate your local database to start the project. The last task dev:fake will generate 1000 random articles for you in the database.

```
git clone git@github.com:donggdeng/blog.git
bundle install
yarn install
rake db:create db:migrate dev:fake
```