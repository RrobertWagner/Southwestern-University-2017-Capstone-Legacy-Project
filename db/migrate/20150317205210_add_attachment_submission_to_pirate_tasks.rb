=begin
This model is used when the user completes a task using an attachment, such as photos tasks.
=end
class AddAttachmentSubmissionToPirateTasks < ActiveRecord::Migration
  def self.up
    change_table :pirate_tasks do |t|
      t.attachment :submission
    end
  end

  def self.down
    remove_attachment :pirate_tasks, :submission
  end
end
