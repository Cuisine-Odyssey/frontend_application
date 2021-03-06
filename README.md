# Cuisine Odyssey Frontend Application

![languages](https://img.shields.io/github/languages/top/cuisine-odyssey/frontend_application?color=red)
![PRs](https://img.shields.io/github/issues-pr-closed/cuisine-odyssey/frontend_application)
![rspec](https://img.shields.io/gem/v/rspec?color=blue&label=rspec)
![simplecov](https://img.shields.io/gem/v/simplecov?color=blue&label=simplecov) <!-- ALL-CONTRIBUTORS-BADGE:START - Do not remove or modify this section -->
[![All Contributors](https://img.shields.io/badge/contributors-6-orange.svg?style=flat)](#contributors-)
<!-- ALL-CONTRIBUTORS-BADGE:END -->


## Background and Description

"Cuisine Odyssey" is a group project inspired by the dilemma of not knowing what to cook for dinner. The app's interface allows the user to spin a globe or a bottle, depending on if they are looking for recipes or cocktails. When the user clicks to spin, a random region is selected and up to 5 recipes are generated. The user can choose to spin again, to save the recipe to their dashboard using a "like" feature, or dislike the recipes. This portion of the project encapsulates the front end of the application and creates the viewable user interface.

Home Page
![Screen Shot 2022-03-04 at 11 04 39 AM](https://user-images.githubusercontent.com/90224504/156797954-6f9caba9-2ab6-4650-98d9-db4c37339c9d.png)

Users Dashboard
![Screen Shot 2022-03-04 at 11 06 31 AM](https://user-images.githubusercontent.com/90224504/156798074-939d316f-ff9a-4c39-a1dc-2029b8bbf2fc.png)

Recipes Index(after *Spin for Recipes* has been clicked)
![Screen Shot 2022-03-04 at 11 08 15 AM](https://user-images.githubusercontent.com/90224504/156798363-6c6526a4-ecbe-4837-a191-8ad8ec0c04d7.png)

Cocktail Show(after *Spin for Drinks* has been clicked)
![Screen Shot 2022-03-04 at 11 10 05 AM](https://user-images.githubusercontent.com/90224504/156798646-29a30bd4-b2c6-4fbd-b05b-0c5eccce19ba.png)

Recipe Show(after a recipe has been selected from the recipes index)
![Screen Shot 2022-03-04 at 11 11 43 AM](https://user-images.githubusercontent.com/90224504/156798921-05707d94-4091-47da-803e-dfd11063dc86.png)


[Heroku Website](https://shielded-forest-41795.herokuapp.com/)

[Backend Application](https://github.com/Cuisine-Odyssey/backend_application) 

![Screen Shot 2022-03-03 at 11 16 17 AM](https://user-images.githubusercontent.com/39470230/156636664-360d9a85-74a8-482e-a82f-9c5bf3a54c35.png)

## Learning Goals

- Consume two or more external APIs 
- Implement Circle CI for continuous integration/testing
- Build APIs that return JSON responses 
- Use an external OAuth provider to authenticate users 
- Refactor code for better code organization/readability 
- Create a project with a separate frontend and backend 
- Implement a production-quality user interface using Bootstrap
- Practice good project management by using project boards, participating in daily stand-ups and team retros 
- Utilize quality workflow practices: small commits, descriptive pull requests, and code reviews 
- Write thorough, understandable documentation



## Requirements and Setup (for Mac):

### Ruby and Rails
- Ruby Version 2.7.2
- Rails Version 5.2.6

### Gems Utilized
- RSpec 
- Pry
- SimpleCov
- Capybara
- Shoulda-Matchers 
- Factory_Bot_Rails
- Faker
- jsonapi-serialize
- omniauth-google-oauth2
- Figaro
- Webmock
- VCR
- jquery-rails
- rspec_junit_formatter
- Orderly
- dotenv-rails

## Setup
1. Clone this repository:
On your local machine open a terminal session and enter the following commands for SSH or HTTPS to clone the repositiory.


- using ssh key <br>
```shell
$ git clone git@github.com:Cuisine-Odyssey/frontend_application.git
```

- using https <br>
```shell
$ git clone https://github.com/Cuisine-Odyssey/frontend_application
```

Once cloned, you'll have a new local copy in the directory you ran the clone command in.

2. Change to the project directory:<br>
In terminal, use `$cd` to navigate to the Frontend Application project directory.

```shell
$ cd frontend_application
```

3. Install required Gems utilizing Bundler: <br>
In terminal, use Bundler to install any missing Gems. If Bundler is not installed, first run the following command.

```shell
$ gem install bundler
```

If Bundler is already installed or after it has been installed, run the following command.

```shell
$ bundle install
```

There should be be verbose text diplayed of the installation process that looks similar to below. (this is not an actual copy of what will be output).

```shell
$ bundle install
Using rake 13.0.6
Using concurrent-ruby 1.1.9
Using i18n 1.9.1
Using minitest 5.15.0
Using thread_safe 0.3.6
Using tzinfo 1.2.9
Using activesupport 5.2.6
Using builder 3.2.4
Using erubi 1.10.0
Using mini_portile2 2.7.1
Using racc 1.6.0
Using nokogiri 1.13.1
Using rails-dom-testing 2.0.3
Using crass 1.0.6
Using loofah 2.13.0
Using rails-html-sanitizer 1.4.2
Using actionview 5.2.6
Using rack 2.2.3
Using rack-test 1.1.0
Using actionpack 5.2.6
Using nio4r 2.5.8
Using websocket-extensions 0.1.5
Using websocket-driver 0.7.5
Using actioncable 5.2.6
Using globalid 1.0.0
Using activejob 5.2.6
Using mini_mime 1.1.2
Using mail 2.7.1
Using actionmailer 5.2.6
Using activemodel 5.2.6
Using arel 9.0.0
Using activerecord 5.2.6
Using marcel 1.0.2
Using activestorage 5.2.6
Using msgpack 1.4.4
Using bootsnap 1.10.3
Using bundler 2.1.4
Using byebug 11.1.3
Using coderay 1.1.3
Using diff-lcs 1.5.0
Using docile 1.4.0
Using factory_bot 6.2.0
Using method_source 1.0.0
Using thor 1.2.1
Using railties 5.2.6
Using factory_bot_rails 6.2.0
Using faker 2.19.0
Using ffi 1.15.5
Using jsonapi-serializer 2.2.0
Using rb-fsevent 0.11.1
Using rb-inotify 0.10.1
Using ruby_dep 1.5.0
Using listen 3.1.5
Using pg 1.3.1
Using pry 0.14.1
Using puma 3.12.6
Using sprockets 4.0.2
Using sprockets-rails 3.4.2
Using rails 5.2.6
Using rspec-support 3.10.3
Using rspec-core 3.10.2
Using rspec-expectations 3.10.2
Using rspec-mocks 3.10.3
Using rspec-rails 5.1.0
Using shoulda-matchers 5.1.0
Using simplecov-html 0.12.3
Using simplecov_json_formatter 0.1.3
Using simplecov 0.21.2
Using spring 2.1.1
Using spring-watcher-listen 2.0.1
```

If there are any errors, verify that bundler, Rails, and your ruby environment are correctly setup.

4. Database Migration<br>
Before using the web application you will need to setup your databases locally by running the following command

```shell
$ rails db: {:drop, :create, :migrate, :seed}
```

5. Set up environment variables

```shell
$ bundle exec figaro install
```
This will create a hidden file called application.yml. In this file you will need to set up a OAuth client_id and client_secret from your OAuth provider. We chose to use Google OAuth, feel free to use which ever provider you would like or alternativley use BCrypt. If BCrypt is used function for password on views and password digest will need to be added into the db migration, views and models.

6. Add backend connection in application.yml to set up a local variable for your endpoints if you choose to deploy outside of localhost.<br>

```shell
BACKEND_CONNECTION: http://localhost:3000/api/v1/ 
```

7. Visit https://www.themealdb.com/api.php to sign up for an API key, the API key you recieve will work for both TheMealDB and TheCocktailDB https://www.thecocktaildb.com/api.php add this in application.yml <br>

```shell
EXTERNAL_API_KEY: api_key_goes_here
```

8. Startup and Access<br>
Finally, in order to use the web app you will have to start the server locally and access the app through a web browser. 
- Start server
```shell
$ rails s
```

- Open web browser and visit link
    http://localhost:5000/
    
At this point you should be taken to the welcome page of the web-app. If you encounter any errors or have not reached the web-app please confirm you followed the steps above and that your environment is properly set up.



## **Contributors** ([emoji key](https://allcontributors.org/docs/en/emoji-key)):

<!-- ALL-CONTRIBUTORS-LIST:START - Do not remove or modify this section -->
<!-- prettier-ignore-start -->
<!-- markdownlint-disable -->
<table>
  <tr>
    <td align="center"><a href="https://github.com/sethperna"><img src="https://avatars.githubusercontent.com/u/90224504?v=4" width="100px;" alt=""/><br /><sub><b>Seth (he/him)</b></sub></a><br /><a href="https://github.com/cuisine-odyssey/frontend_application/commits?author=sethperna" title="Code">????</a> <a href="https://github.com/Cuisine-Odyssey/frontend_application/pulls?q=is%3Apr+author%3ASethPerna" title="Reviewed Pull Requests">????</a>
     </td>
       <td align="center"><a href="https://github.com/kanderson852"><img src="https://avatars.githubusercontent.com/u/89998621?v=4" width="100px;" alt=""/><br /><sub><b>Kelly(she/her)</b></sub></a><br /><a href="https://github.com/cuisine-odyssey/frontend_application/commits?author=kanderson852" title="Code">????</a> <a href="https://github.com/Cuisine-Odyssey/frontend_application/pulls?q=is%3Apr+author%3Akanderson852" title="Reviewed Pull Requests">????</a>
     </td>
      <td align="center"><a href="https://github.com/dylan-harper"><img src="https://avatars.githubusercontent.com/u/39470230?v=4" width="100px;" alt=""/><br /><sub><b>Dylan(he/him)</b></sub></a><br /><a href="https://github.com/cuisine-odyssey/frontend_application/commits?author=dylan-harper" title="Code">????</a> <a href="https://github.com/Cuisine-Odyssey/frontend_application/pulls?q=is%3Apr+author%3Adylan-harper" title="Reviewed Pull Requests">????</a>
     </td>
      <td align="center"><a href="https://github.com/WadeNaughton"><img src="https://avatars.githubusercontent.com/u/90228086?v=4" width="100px;" alt=""/><br /><sub><b>Wade(he/him)</b></sub></a><br /><a href="https://github.com/cuisine-odyssey/frontend_application/commits?author=WadeNaughton" title="Code">????</a> <a href="https://github.com/Cuisine-Odyssey/frontend_application/pulls?q=is%3Apr+author%3AWadeNaughton" title="Reviewed Pull Requests">????</a>
     </td>
      <td align="center"><a href="https://github.com/hannahkwarren"><img src="https://avatars.githubusercontent.com/u/17674781?v=4" width="100px;" alt=""/><br /><sub><b>Hannah(she/her)</b></sub></a><br /><a href="https://github.com/cuisine-odyssey/frontend_application/commits?author=hannahkwarren" title="Code">????</a> <a href="https://github.com/Cuisine-Odyssey/frontend_application/pulls?q=is%3Apr+author%3Ahannahkwarren" title="Reviewed Pull Requests">????</a>
     </td>
      <td align="center"><a href="https://github.com/dkassin"><img src="https://avatars.githubusercontent.com/u/76177498?v=4" width="100px;" alt=""/><br /><sub><b>David(he/him)</b></sub></a><br /><a href="https://github.com/cuisine-odyssey/frontend_application/commits?author=dkassin" title="Code">????</a> <a href="https://github.com/Cuisine-Odyssey/frontend_application/pulls?q=is%3Apr+author%3Adkassin" title="Reviewed Pull Requests">????</a>
     </td>
    </tr>
</table>

<!-- markdownlint-restore -->
<!-- prettier-ignore-end -->

<!-- ALL-CONTRIBUTORS-LIST:END -->

This project follows the [all-contributors](https://github.com/all-contributors/all-contributors) specification.
<!--

