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
  
# params.require(:user).permit(:admin, :admin_password)
 
#  I put in this code to heighten password complexity requirements,
#  but it seems to be too restrictive?
  validate :password_complexity
  
  def password_complexity
    if password.present?
      if !password.match(/^(?=\S*[a-z])(?=\S*[A-Z])(?=\S*\d)\S+/) 
        #length requirements already work, but to combine them into this regex in the future, do:
        #remove the plus after last \S, then write { 8,128} (need to confirm)
        errors.add :password, "must include at least one lowercase letter, one uppercase letter, and one digit"
      end 
    end
  end
#password.match(/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d). /)

   validates :admin_password, with: @admin_password_match
   
    
    # def admin_password_match
    #     puts "We get in the definition"
    #     if admin_password.present?
    #         if admin_password.match("pirateAdmin")
    #             puts "got to if in user"
    #             return true 
    #         else
    #             puts "got to esle in user"
    #             return false
    #         end
    #     else
    #         return false
    #     end
    # end
  
  has_many :hunts #this is for pirate id
  has_many :pirate_hunts, :dependent => :destroy
  has_many :pirate_tasks, :dependent => :destroy
  #attr_accessible :display_name
  #accepts_nested_attributes_for :user, allow_destroy: true
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable
    
    
    
    validate :password_complexity
    
    def password_complexity
        if password.present?
            if !password.match(/^(?=\S*[a-z])(?=\S*[A-Z])(?=\S*\d)\S+/)
                #length requirements already work, but to combine them into this regex in the future, do:
                #remove the plus after last \S, then write { 8,128} (need to confirm)
                errors.add :password, "must include at least one lowercase letter, one uppercase letter, and one digit"
            end
        end
    end
    
    
   validates :admin_password, with: @admin_password_match
   
    
    # def admin_password_match
    #     puts "We get in the definition"
    #     if admin_password.present?
    #         if admin_password.match("pirateAdmin")
    #             puts "got to if in user"
    #             return true 
    #         else
    #             puts "got to esle in user"
    #             return false
    #         end
    #     else
    #         return false
    #     end
    # end
    
    
    
    
    
    has_many :hunts #this is for pirate id
    has_many :pirate_hunts, :dependent => :destroy
    has_many :pirate_tasks, :dependent => :destroy
    #attr_accessible :display_name
    #accepts_nested_attributes_for :user, allow_destroy: true 
end

# def create
#   User.create!(params.require(:user).permit(:admin, :admin_password))
# end
