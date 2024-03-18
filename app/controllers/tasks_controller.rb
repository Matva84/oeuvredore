class TasksController < ApplicationController
  def new
    @project = Project.find(params[:project_id])
    @task_new = Task.new
  end

  def create
    raise
    @project = Project.find(params[:project_id])
    @task_new = Task.new
    # construire la fonction date
  end

  def edit

  end

  def update

  end

  private

  def params_task
    params.require(:task).permit(:name, :description, :category, :start_at, :end_at, :progress, :budget, :photo)
  end


end
