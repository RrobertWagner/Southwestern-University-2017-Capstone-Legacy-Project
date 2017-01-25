=begin
Change the attributes of a Pirate Task when a Q/A submission has been completed by the user
=end
class AddQaSubmissionToPirateTask < ActiveRecord::Migration
  def change
    add_column :pirate_tasks, :qa_submission, :string
  end
end
