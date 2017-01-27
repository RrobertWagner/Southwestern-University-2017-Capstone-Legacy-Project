class PirateHuntsController < ApplicationController
  #def myHunts
  #end

  def new
	@pirate_hunt = PirateHunt.new
  end

  # Move this to hunt#join ?
  # Todo: Lock joining a hunt until published? Or have task#create check for
  #       all respective PirateHunt(s) and add the new PirateTask to them.
  # Moved
  def create
  end

  def index
  	@pirate_hunt = PirateHunt.all
  end

  def show
    @pirate_hunt = PirateHunt.find(params[:id])
    if(@pirate_hunt.user_id != current_user.id)
      redirect_to(root_path, alert: "You are not authorized to view this page")
    else
      @pirate_tasks = @pirate_hunt.pirate_tasks
      #there is definitely a better way to do this... --kks
      tasks = Task.where(task_type: '1', hunt_id: @pirate_hunt.hunt)
      @photo_tasks = Array.new
      tasks.each do |task|
        task.pirate_tasks.each do |ptask|
          if(ptask.completed)
            @photo_tasks.push(ptask)
          end
        end
      end
    end
  end

  def edit
  	@pirate_hunt = PirateHunt.find(params[:id])
  end

  def update
   @pirate_hunt = PirateHunt.find(params[:id])
   @pirate_hunt.update_attributes(pirate_hunt_params)
   redirect_to(:action => 'show', :id => @pirate_hunt.id)
   #took out if/else b/c would rather always redirect to task page, but w/
   #error message displayed on failure to update (UI functionality??)
  end

  def delete
  end

  def destroy
    PirateHunt.find(params[:id]).destroy
    redirect_to(root_path, notice: "You have successfully left this hunt")
  end
  
  private
  def pirate_hunt_params
    params.require(:pirate_hunt).permit(:completed, :user_id, :hunt_id)
  end
end
