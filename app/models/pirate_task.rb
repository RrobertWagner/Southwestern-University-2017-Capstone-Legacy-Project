=begin
Pirate Tasks contain the Task information related to a specific User. This is done via associations that
link the Pirate Task to similar information as Tasks. Each Pirate Task belongs to a specific User as well as
a Pirate Hunt that should belong to that same User. A Pirate Task also belongs to the Task that it is a 
personalized copy of and the Hunt that that Task belongs to. Pirate Tasks can have file attached to them
for submissions such as Photos, so code related to that is used as well.
=end
class PirateTask < ActiveRecord::Base #Singular because it is a class
  #I think 'index:true' syntax only applies if you declare the association in the migration file
  belongs_to :user #, index:true
  belongs_to :hunt #, index:true #overload of inferrmation
  belongs_to :task #, index:true #https://github.com/rails/rails/pull/5262#issuecomment-4329571
  belongs_to :pirate_hunt
    #https://www.youtube.com/watch?v=Z5W-Y3aROVE
    
    #Can add file sizes here
  has_attached_file :submission, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.jpg"
    
    validates_attachment :submission,
  :content_type => { :content_type => ["image/jpeg", "image/gif", "image/png"] }
    
# Validate content type
#  validates_attachment_content_type :submission, :content_type => /\Aimage/
#  # Validate filename
#  validates_attachment_file_name :submission, :matches => [/png\Z/, /jpe?g\Z/]
#  # Explicitly do not validate
#  do_not_validate_attachment_file_type :submission

  def check_answer
    if self.task.task_type == 0
      if self.qa_submission == self.task.correct_answer
        self.update_attributes(:completed => true)
        return self, :correct
      else
        return self, :incorrect
      end
    elsif self.task.task_type == 1
      if self.answer_uploaded == true
        return self, :waiting
      end
    else #pirate_task.task_type == 1
      if self.answer_uploaded == true
        return self, :waiting
      end
    end
  end
    
end

