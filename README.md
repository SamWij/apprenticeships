# apprenticeships

HEROKU LINK:  ![alt tag](https://agile-everglades-75697.herokuapp.com/ "Site Map")

## what is apprenticeships

The apprenticeships portal is for apprentices to upload/create their work profiles and actively look for apprentice roles.  
There are no openly public portals for apprentices to register, this enables employers to view profiles and for apprentices to actively seek work in one place.

## approach to the problem
I approached the problem by starting to draw out the erd and site map.  The ERD was then split into MVP and future state.  I decided to just focus on apprentices with the employer login
being a secondary feature set.

ERD:
![alt tag](https://github.com/SamWij/apprenticeships/blob/master/apprentice_erd-2.jpg "Site Map")

Site Map:
![alt tag](https://github.com/SamWij/apprenticeships/blob/master/apprentice_erd.jpg "relationship diagram")



##Challenges

###Sinatra vs Active Records
Not understanding how ruby routes worked and understanding what Sinatra does and what Ruby does with active records.  I also did not fully understand routes and sessions so struggled in the authentication and how to pass through user ID sessions between get and post routes.

###Dynamically adding form fields
I wanted to add form fields for work experience, education, licenses and referees. So a user can just add how many they wanted.  This was quite difficult and needed javascript.  I struggled to remember javascript! and then could not figure out how i could also add multiple records to the database at once.  This is a future state piece of work.

###sessions, login and logout
I don't understand this properly and was apparent through this assignment. Also not working on one module at a time led to more confusion.

## Things Not Finished/ To Do Items
Validations
Session and logins
Employer components
Dynamically adding fields
Amend the out of the box bootstrap css.

##Learnings
don't panic!
complete one component at a time, this was a bigger project and I was all over the shop.
user trello (i did have a trello board set up with features and to do items which, when panic set in I didn't use)
Learn ruby, sinatra and get a better understanding of active records.
