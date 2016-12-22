# README

* Please be aware that I've developed it on Windows.
* So that there is a rake task with references to json files with C:\...\files\
* Also I've added the ~create_db.bat that prepares the db tables and also migrates 
the data from the two json files into the db using the import.rake task.

* After everything is ready you just go to 
http://localhost:3000
click on link and see the map.
* Also if you have no time to install this, see the screenshots under the /gett/screenshots
* The rake file can be found here https://github.com/maximka2000/gett/blob/master/lib/tasks/import.rake
* Actually there are two controllers and views that I developed here: 
  https://github.com/maximka2000/gett/blob/master/app/controllers/map_controller.rb 
  https://github.com/maximka2000/gett/blob/master/app/controllers/welcome_controller.rb
  https://github.com/maximka2000/gett/blob/master/app/views/welcome/index.html.erb
  https://github.com/maximka2000/gett/blob/master/app/views/map/index.html.erb
  