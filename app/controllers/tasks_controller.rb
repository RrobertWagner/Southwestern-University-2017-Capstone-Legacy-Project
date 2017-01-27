class TasksController < ApplicationController
  
  #Added this line according to Christian's specs
  #@huntID = params[:hunt_id]
  #Can't actually add, keeps giving me an error. Christian, get with me to resolve this if it continues to be an issue -RLW
    
  #I changed the index method to be the "myTasks" page for the specified hunt, thus the /hunts/x/tasks page should have all tasks associated with the hunt id x available to it
    
  def new
      @task = Task.new
      @huntID = params[:hunt_id]
  end

  def create
    @task = Task.new(task_params)
    @huntID = params[:hunt_id]
    if @task.save
      @task.create_pirate_tasks
      redirect_to(hunt_path(@huntID))
      flash.now[:notice] = "Task Added to Hunt"
    else
      flash.now[:alert] = "One or More Required Fields Left Blank"
      render('new') #also maybe changes?
    end
  end

    #	If a Hunt is not published but the User is the creator, then we want to show
	#	all of the Tasks.
	
	#	If the Hunt is published and the Hunt is inactive and you are
	#	a participant of the Hunt, then you cannot see the Tasks.
	
	#	If the Hunt is active, then everyone can see the Tasks
	
	#	If a Hunt is published but inactive and you are the creator, then you should
	#	be able to see the Tasks but not change them.
  def index
    #Grabs all tasks with the indicated hunt_id
    @task = Task.find(params[:hunt_id])
  end

  def show
      @task = Task.find(params[:id])
  end
    

  def edit
      @task = Task.find(params[:id])
  end

  def update
   @task = Task.find(params[:id])
   @task.update_attributes(task_params)
   redirect_to(:action => 'show', :id => @task.id)
   #took out if/else b/c would rather always redirect to task page, but w/ error message displayed on failure to update (UI functionality??)
  end

  def delete
  end

  def destroy
    Task.find(params[:id]).destroy
    redirect_to :action => 'index'
  end
  
  private
  def task_params
    params.require(:task).permit(:points, :clue, :task_type, :correct_answer, :prompt, :hunt_id)
    #added :hunt_id to the above according to Christian's specs  

  end
end
