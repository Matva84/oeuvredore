class TasksController < ApplicationController
  def new
    @task_new = Task.new
  end

  def create
    @task_new = Task.new
  end
end
