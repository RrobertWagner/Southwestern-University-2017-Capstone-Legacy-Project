=begin
The associations for Hunts are listed here. Every hunt can have multiple tasks linked to it as well as
many Pirate Hunts. Each Hunt also belongs to the User who created it.
=end
class Hunt < ActiveRecord::Base #Singular because it is a class
  has_many :tasks, :dependent => :destroy#, :class_name=> 'Task'
  has_many :pirate_tasks
  belongs_to :user#, :class_name=> 'Pirate' #This is for the author
  has_many :pirate_hunts, :dependent => :destroy

  validates :title, presence: true
  validates :start_time, presence: true
  validates :start_date, presence: true
  validates :end_time, presence: true
  validates :end_date, presence: true

  # Have a user join a hunt. Will return the PirateHunt (if any) and a symbol:
  #  :success if successfully joined the hunt
  #  :already_joined if the user had already joined the hunt
  #  :error if some error occurred while joining the hunt (while saving PirateHunt)
  def join(user)
    # Check if user has already joined the hunt
    phunt = PirateHunt.find_by(user_id: user.id, hunt_id: self.id)
    if phunt then return phunt, :already_joined end

    # There's probably a better way to do this..
    phunt = PirateHunt.create(hunt: self, user: user)

    if phunt.save
      # Create each PirateTask
      self.tasks.each do |task|
        PirateTask.create(task: task, hunt: self, user: user, pirate_hunt: phunt, answer_uploaded: false, completed: false).save
      end
      return phunt, :success
    else
      return phunt, :error
    end
  end
  
  #search
  def self.search(search)
    #searches by title, location, or username
    joins("INNER JOIN users ON users.id = hunts.user_id").where("title LIKE ? OR start_location LIKE ? OR display_name LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%")
    #joining on users.id = hunts.id causes huge issues because those fields don't match up,
    #so I use users.id = hunts.user_id
  end

end
