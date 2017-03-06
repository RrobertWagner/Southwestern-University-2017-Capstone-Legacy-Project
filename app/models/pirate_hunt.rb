=begin
Pirate Hunt associations
Just like a Hunt, every Pirate Hunt can have multiple Tasks and belongs to the User who created it. However,
Pirate Hunts also belong to a Hunt
=end
class PirateHunt < ActiveRecord::Base #Singular because it is a class
	#I think 'index:true' syntax only applies if you declare the association in the migration file
	belongs_to :user #, index:true #this makes it a field in the table
	belongs_to :hunt #, index:true #http://stackoverflow.com/questions/3401504/can-model-belong-to-two-other-models-and-have-a-nested-relationship
	has_many :pirate_tasks, :dependent => :destroy
	
	after_initialize :set_points #this sets the points column to 0 after a person joins a hunt
    def set_points
        self.points ||= 0.0
    end    
end
