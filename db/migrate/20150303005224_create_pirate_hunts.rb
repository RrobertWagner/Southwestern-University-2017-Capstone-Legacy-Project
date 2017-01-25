=begin
A Pirate Hunt is the information about a hunt that relates to a specific user. Pirate Hunts are created 
when a user joins a hunt to store data relating to that user's actions. The boolean :completed is used 
to denote whether or not the user has completed the hunt.
=end

class CreatePirateHunts < ActiveRecord::Migration #plural because it is a migration
  def change
    create_table :pirate_hunts do |t|
      t.boolean :completed
      t.references :user
      t.references :hunt #REFERENCES are for the ID field
      t.timestamps null: false
    end
  end
end
