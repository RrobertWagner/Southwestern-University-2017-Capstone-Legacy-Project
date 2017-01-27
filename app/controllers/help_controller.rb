class HelpController < ActionController::Base
  #This controller is not nested under application controller, so it does not need the user to be logged in to view. I'm not sure why the next line is necessary. 
  protect_from_forgery with: :exception
    
    
  def index
  end
end
