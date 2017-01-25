=begin
A Pirate Task is the information about a task that relates to a specific user. Pirate Tasks are created 
when a user joins a hunt to store data relating to that user's actions. The boolean :completed is used 
to denote whether or not the user has completed the task. :answer_uploaded also keeps track of if the user
has submitted an answer.
=end

class CreatePirateTasks < ActiveRecord::Migration #plural because it is a migration
  def change
    create_table :pirate_tasks do |t|
      t.boolean :answer_uploaded
      t.boolean :completed
      t.references :user #REFERENCES are for the ID field
      t.references :task
      t.references :hunt 

      t.timestamps null: false
    end
  end
end
