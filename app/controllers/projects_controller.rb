class ProjectsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @user = current_user
    @users = User.all
    @show_all_projects = params[:show_all] == "true" && params[:show_all] != "false"
    @projects = @show_all_projects ? Project.all : Project.limit(3)
  end

  def new
    @project = Project.new
  end

  def show
    @project = Project.find(params[:id])
  end

  def create
    @user = current_user
    @project = Project.new(project_params)
    @project.user_id = @user.id
    if @project.save
      redirect_to projects_path, notice: 'Le projet a été créé avec succès.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def project_params
    params.require(:project).permit(:title, :description, :address, :initial_start_at, :initial_end_at, :progress, :customer_budget, :total_expenses)
  end

end
