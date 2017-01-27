=begin
The User model was created using Devise. Thus, many device modules are used. Users can join or create
multiple Hunts and for each Hunt a Pirate Hunt is created and a Pirate Task for every Task within the
Hunts. 
=end

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :hunts #this is for pirate id
  has_many :pirate_hunts, :dependent => :destroy
  has_many :pirate_tasks, :dependent => :destroy
  #attr_accessible :display_name
  #accepts_nested_attributes_for :user, allow_destroy: true   
end
