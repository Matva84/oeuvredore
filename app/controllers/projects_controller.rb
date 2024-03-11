class ProjectsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @user = current_user
    @users = User.all
    @show_all_projects = params[:show_all] == "true" && params[:show_all] != "false"

    @projects_all = Project.all
    @projects = []
    @projects_all.each do |project|
      #if project.user.pro == true && project.user_id == @user.id
      #  @projects << project
      #else project.user.pro == false && project.customer_id == @user.id
      #  @projects << project
      #end
      if project.user_id == @user.id || project.customer_id == @user.id
          @projects << project
      end
    end

    # @projects = @show_all_projects ? Project.all : Project.limit(3)
    # @projects = @show_all_projects ? @projects : @projects.limit(3)
  end

  def new
    @project = Project.new
  end

  def show
    @project = Project.find(params[:id])
    @tasks = @project.tasks
    @user = @project.user
    @customer = @project.customer
    @chatroom = @project.chatroom
    @message = Message.new
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
