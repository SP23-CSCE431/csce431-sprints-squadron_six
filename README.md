# README

## Introduction

Application Description

## Requirements

This code has been run and tested on:

- Ruby - 3.1.2
- Rails - 7.0.4
- Ruby Gems - Listed in `Gemfile`
- PostgreSQL - 1.1
- Rubocop - Listed in ‘Gemfile’
- Docker paulinewade/csce431:latest


## External Deps

- Docker - Download latest version at https://www.docker.com/products/docker-desktop
- Heroku CLI - Download latest version at https://devcenter.heroku.com/articles/heroku-cli
- Git - Downloat latest version at https://git-scm.com/book/en/v2/Getting-Started-Installing-Git
- GitHub Desktop (Not needed, but HELPFUL) at https://desktop.github.com/

## Installation

Download this code repository by using git:

`git clone https://github.com/SP23-CSCE431/csce431-sprints-squadron_six.git

## Tests

An RSpec test suite is available and can be ran using:

`rspec spec/`

You can run all the test cases by running. This will run both the unit and integration tests.
`rspec .`

## Execute Code

Run the following code in Powershell if using windows or the terminal using Linux/Mac

`cd csce431-sprints-squadron_six`

`docker run --rm -it --volume "$(pwd):/rails_app" -e DATABASE_USER=test_app -e DATABASE_PASSWORD=test_password -p 3000:3000 paulinewade/csce431:latest`

Docker exec -it {IMAGE NAME} /bin/bash


Install the app

`bundle install && rails webpacker:install && rails db:create && db:migrate`


Run the app
`rails server --binding:0.0.0.0`


The application can be seen using a browser and navigating to http://localhost:3000/


## Environmental Variables/Files




## Deployment
Setup a Heroku account: https://signup.heroku.com/

From the heroku dashboard select `New` -> `Create New Pipline`

Name the pipeline, and link the respective git repo to the pipline

Our application does not need any extra options, so select `Enable Review Apps` right away

Click `New app` under review apps, and link your test branch from your repo

Under staging app, select `Create new app` and link your main branch from your repo

--------

Now once your pipeline has built the apps, select `Open app` to open the app

With the staging app, if you would like to move the app to production, click the two up and down arrows and select `Move to production`

And now your application is setup and in production mode!




## CI/CD

For continuous development, we set up Heroku to automatically deploy our apps when their respective github branches are updated.

  `Review app: dev branch`

  `Production app: main branch`

CI/CD has been implemented in the GitHub Actions in the repo here -> https://github.com/SP23-CSCE431/csce431-sprints-squadron_six/actions

## Support

This app is currently in development so support is not yet implemented.

## Extra Helps

Please contact Pauline Wade paulinewade@tamu.edu for help on Lab assignments which will teach you in more depth.
