class WelcomeController < ApplicationController
  def index
  	@created_hunts = Hunt.where(user_id: current_user.id)
  	@joined_hunts = PirateHunt.where(user_id: current_user.id)
  end
    
end
