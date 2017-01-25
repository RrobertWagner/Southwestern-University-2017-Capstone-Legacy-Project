# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

now = Time.parse("Thu Nov 29 14:33:20 GMT 2001")

natalia = User.create(
   display_name: 'HomeSkillet', 
   email: 'rockon4nat@yahoo.com') #rest is implied null
#need to investigate seeding of users

capstone = Hunt.create( #analogous to capstone hunt we played
   title: "Capstone Hunt",
   active: 1, 
   published: 1,
   public: 1, 
   start_time: now,
   end_time: now,
   start_date: 2015-02-01,
   end_date: 2015-02-03,
   start_location: 'Mood Bridwell Hall',
   description: 'A hunt to test the models',
   user_id: natalia.id
   )

todo = Task.create(
   task_type: 3,
   points: 25,
   prompt: 'How many couches are there in the CS lounge?',
   clue: 'It is near the fountain on the first floor of MBH',
   correct_answer: '2',
   hunt_id: capstone.id
    )


joined = PirateHunt.create(
   completed: 1,
   user_id: natalia.id,
   hunt_id: capstone.id
   )


answers = PirateTask.create(
   answer_uploaded: 1,
   completed: 1,
   user_id: natalia.id,
   task_id: todo.id #need to lookup hunts
   ) 