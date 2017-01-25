=begin
Tasks are the scavenger hunt items that the users complete to earn points. Each task belongs to a hunt and
multiple tasks can belong to each hunt. When created, tasks are assigned a type (GPS, photo, or question
and answer) and points that a user will earn for completing the task. It is necessary for tasks to also have
prompts (short messages for the task), prompts (longer descriptions), and a correct answer that when provided
by the user will give them points
=end

class CreateTasks < ActiveRecord::Migration #plural because it is a migration
  def change #in db
    create_table :tasks do |t|
      t.integer :task_type #1:GPS, 2:Photo 3:Q/A
      t.integer :points #the amount given to the user once the task is completed
      t.string :prompt #short message for task
      t.string :clue #longer description; a "hint" to help the user
      t.string :correct_answer
      t.references :hunt #REFERENCES are for the ID field

      t.timestamps null: false
    end
  end
end
