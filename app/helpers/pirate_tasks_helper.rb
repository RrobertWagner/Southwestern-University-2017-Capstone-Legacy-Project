module PirateTasksHelper
  # Get the path used to reject a PirateTask
  # task param may be either a PirateTask or a PirateTask id
  def reject_pirate_task_path(task)
    if not task.is_a?(Integer) then task = task.id end
    "/pirate_tasks/#{task}/reject"
  end

  def approve_pirate_task_path(task)
  	if not task.is_a?(Integer) then task = task.id end
  	"/pirate_tasks/#{task}/approve"
  end
end
