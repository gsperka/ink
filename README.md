<strong>Eversketch</strong>

<http://www.eversketch.co>

Created by:

- Gary Sperka [@GarySperka](https://twitter.com/GarySperka) - [LinkedIn](https://www.linkedin.com/pub/gary-sperka/30/7b/553/) - <gsperka@gmail.com>
- Lydia Koller [@lydiakoller1](https://twitter.com/lydiakoller1) - [LinkedIn](https://www.linkedin.com/pub/lydia-koller/75/332/b33) - <lydiakoller1@gmail.com>
- Jacky Sum [@Jsum528](https://twitter.com/Jsum528) - <jsum528@icloud.com>
- Sam Blackman [@srossblack](https://twitter.com/srossblack) - [LinkedIn](https://www.linkedin.com/in/samuelblackman) - <sblackman@gmail.com>

##About

This is our final group project for Dev Bootcamp (Chicago, IL) - Squirrels 2014

Eversketch begin as an idea in which users can collaborate with each other through sketches. There is no limit on the amount of sketches that can
be created or on the amount of other user's sketches that can be modified. The idea is be able to start your own artistic vision on a blank canvas
or be able to add your vision to another user's sketch to see how it progresses from there.

##Install

- Fork the repo and clone the files onto your local machine:

                      $ git clone https://github.com/jsum528/ink.git

- Navigate to the application directory in terminal and run **bundle install** to gather the required gems:

                      $ bundle install

- After bundle, you will need to set the environment variables in your terminal. To get the correct values,
  you will have to visit https://code.google.com/apis/console and set up your own Client ID, Client secret, and make
  sure to list your Redirect URI to: http://localhost:3000/auth/google_oauth2/callback

      GOOGLE_KEY: Client ID from Google API console
      GOOGLE_SECRET: Client secret from Google API console
      SECRET_KEY_BASE: .config.secret_key_base from config/initializers/secret_token.rb

- Example

                      Client Id = '1234567890' (provided from Google API)

- Type in the same terminal shell:

                      export GOOGLE_KEY=1234567890

- Type

                      printenv

   GOOGLE_KEY should be listed. If it is not, you are in the wrong terminal shell

- Run the rake commands to create, migrate and seed a postgres db:

      $ rake db:create && rake db:migrate && rake db:seed

- Launch the application server

      $ rails s

- Open a browser and navigate to localhost:3000

- Enjoy

##Usage

After the application is up and running, you will have the ability to begin creating a sketch. A new user will have to sign up/log in to have the drawing saved. Once saved, a "tree" will be created.

A tree is the first sketch that (hopefully) grows into many more sketches. You will be unable to make additional sketches to your original copy until someone else adds their vision to your sketch. If you come across any other user's sketches, feel free to add (or remove) any artwork you'd like. You will be able to view the tree's history and see the progression from where the tree started to where it currently is.

##Design

Our first goal was the get an MVP up and running as soon as possible (the goal was on Day 2). After achieving our MVP, we held daily stand-ups to discuss the future features that we would be implementing in our app. We soon discovered that we couldn't implement all of our ideas and that some of the ideas that we really wanted would take a decent amount of time to write. Luckily, we had a great team dynamic and were able to work together to work through the big issues.

Front end: We relied on javascript to render images on the home page that were created by other users.
* Need more *

Back end: Our team decided to save the image data as JSON as opposed to png files. The logic behind this was that JSON would take up much less memory
and would be easier to access for our d3 tree model. In terms of our drawning canvas, we used Fabric.js. This allowed users to access the site on a mobile device (or iPad) and not run into any issues.

## Final Thoughts

We wanted to give a big thank you to Dev Bootcamp and all of its instructors over the course of the past 9 weeks: Mike Busch, Jen Myers, Ryan Birones, Nate 'Diesel Powered Dozer' Delage, Zach Rivest, Matt Baker and Dev Bootcamp Mentor Ashish Dixit.

We are extremely pleased with the final product. Looking back, implementing d3 and Google Oauth were a bit more difficult than we originally planned
but learned a lot during the process. Our team still has many ideas that we would eventually like to roll out. These ideas include:

-Progressive animation of the image

-Facebook / Twitter Oauth

-Social media integration

-Higher security measures (email verification, password reset)
