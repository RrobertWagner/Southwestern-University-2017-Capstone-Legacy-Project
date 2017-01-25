=begin
This model is used to link a Pirate Hunt and a Pirate Task
=end
class AddPirateHuntIdToPirateTask < ActiveRecord::Migration
  def change
    add_reference :pirate_tasks, :pirate_hunt, index: true
  end
end
