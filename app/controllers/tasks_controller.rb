class TasksController < ApplicationController
  def new
    @project = Project.find(params[:project_id])
    @task_new = Task.new
  end

  def create
    @start_at = params[:task]["start_at"].to_date
    @end_at = params[:task]["end_at"].to_date
    @project = Project.find(params[:project_id])
    @task_new = Task.new(params_task)
    @task_new.project_id = params[:project_id]
    @task_new.start_at = @start_at
    @task_new.end_at = @end_at
    if @task_new.save!
      redirect_to project_path(@project.id), notice: 'La tâche a été ajoutée.'
    else
      render :new, alert: 'Vérifiez les informations'
    end
  end

  def edit
    @project = Project.find(params[:project_id])
    @task = Task.find(params[:id])
  end

  def update
    @project = Project.find(params[:project_id])
    @task = Task.find(params[:id])
    @start_at = params[:task]["start_at"].to_date
    @end_at = params[:task]["end_at"].to_date
    @task.project_id = params[:project_id]
    @task.start_at = @start_at
    @task.end_at = @end_at
    @task.update(params_task)
    redirect_to project_path(@project.id), notice: 'La tâche a été actualisée.'
  end

  private

  def params_task
    params.require(:task).permit(:name, :description, :category, :progress, :budget, :photo)
  end


end
