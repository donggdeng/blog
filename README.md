## Project Description/Summary

This project implements a basic CRUD and search feature for blogs.

## Ruby version

3.0.2

## Nodejs version

16.12.0

## Tasks to run for setting up

You need to create and migrate your local database to start the project. The last task dev:fake will generate 1000 random articles for you in your local database.

```
git clone git@github.com:donggdeng/blog.git
bundle install
yarn install
rake db:create db:migrate dev:fake
```

## Basic Features

1. User registration, login/logout and profile update
2. View articles (paginated)
3. View, update and delete articles 
4. Search articles according to title or author

## Tests

Rspec and Capybara are used for automated testing. The command 'rspec' will run all the tests. 

1. Unit tests for Article search funtion
2. Function tests for happy path of User Registration and Login
3. Function tests for happy path of View Articles and Update Article

## Problems encountered and how I resolve them

1. I failed to start the rails server at the first place. It says in the logs that the webpacker can't find application.js, which is weird, because it's a newly created app. It turned out I'm using version 17.0.1 of nodejs, which is the lastest version and not stable. So I downgraded it to v16.12.0 with nvm to fix it.

2. I spent some time to find a good datepicker for the date selector in Article New/Update form. Since I'm using Bootstrap for app styles, I initially went to look for bootstrap related gem. I remembered that I had some bad experience using bootstrap datepicker. The bootstrap-datepicker which has the most downloads on rubygems.org seems very outdated. So I turned to look for some alternatives. I ended up with Flatpickr. It's very nice and clean, and easy to setup.

3. The notice message on top of the page, such as "Article was successfully updated", is nice and useful. The pain is that the message stays on the page unless the user referesh the current page. It would be a better user experience if the message displays for several seconds and disappear. My initial thought was writing some addClass/removeClass and timeOut function in javascript. But I felt it's ugly to write this snippet in javascript merely for this little function. It's quite an early stage of this product. There might be a chance I need to switch to a frontend framework soon in the future. So it's neccessary to keep everything tidy and clean for the time being. Still, I wasn't sure that pure CSS is capable of doing this. But it's worth a try. After some reseraches and attempts, I ended up using CSS animation with keyframes to do this.

