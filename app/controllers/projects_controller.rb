class ProjectsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @user = current_user
    @users = User.all
    @projects = Project.all

  end

  def new
  end

  def show
    @project = Project.find(params[:id])
    @tasks = @project.tasks
    @customer = User.find(@project.customer_id)
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def projects_params
    params.require(:project).permit(:title, :descritpion, :address, :initial_start_at, :initial_end_at, :progress, :customer_budget, :total_expenses)
  end

end
