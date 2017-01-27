#Task Model allows there to be a field of tasks that are
# associated with hunts because tasks belong to hunts in our model
# architecture. That way we can know which tasks coincide with the 
# proper hunt. Otherwise there would just be tasks running crazy and 
# not allocating their points to the right hunt. 

class Task < ActiveRecord::Base #Singular because it is a class
	#I think 'index:true' syntax only applies if you declare the association in the migration file
	belongs_to :hunt #, index :true
	has_many :pirate_tasks
	#no longer relevant because we decided to have one tasks model
	#with fields for each type of answer.
	#has_many :photos, :class_name=> 'Photo'
	#has_many :questions, :class_name=> 'Question'
	#has_many :GPSs, :class_name=> 'GPS'

        validates :points, presence: true
	validates :prompt, presence: true
	validates :correct_answer, presence: true, if: :is_qa?

	def is_qa?
		task_type == 0
	end

  # Create all PirateTasks for existing PirateHunts related
  # to this Task
  def create_pirate_tasks
    phunts = PirateHunt.where(hunt: hunt).to_a
    phunts.each do |phunt|
      PirateTask.create(user: phunt.user, hunt: self.hunt, task: self, pirate_hunt: phunt, answer_uploaded: false, completed: false)
    end
  end
end
