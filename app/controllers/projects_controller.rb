class ProjectsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @user = current_user
    @users = User.all
    @project = Project.new
    @show_all_projects = params[:show_all] == "true"
    if @show_all_projects
      @projects = Project.where(user_id: @user.id).or(Project.where(customer_id: @user.id))
    else
      @projects = Project.where(user_id: @user.id).or(Project.where(customer_id: @user.id)).limit(6)
    end
    @total_projects = Project.where(user_id: @user.id).or(Project.where(customer_id: @user.id)).count
    @projects.each do |project|
      project.progress = progress_calcul(project)
      project.save
    end
  end

  def new
    @project = Project.new
  end

  def show
    @project = Project.find(params[:id])
    @task_new = Task.new
    @tasks = @project.tasks
    @user = @project.user
    @customer = @project.customer
    @chatroom = @project.chatroom
    @message = Message.new
    @documents = @project.documents
    @project.total_expenses = expenses_calcul(@project)
    @project.save
    @project_tags = ["document", "photo"]
    @documents.each do |doc|
      doc.tag_list.each do |tag|
        @project_tags << tag
        puts tag
      end
    end
    @project_tags = @project_tags.uniq
  end

  def create
    @user = current_user
    @project = Project.new(project_params)
    @project.user_id = @user.id
    @project.customer_id = params[:project][:customer_id]
    @chatroom = Chatroom.new(name: "Chatroom for #{@project.title}")
    @project.chatroom = @chatroom
    @project_tags = ["document", "photo"]
    if @project.save && @chatroom.save
      # Créer une nouvelle tâche avec les dates de début et de fin du projet
      @task = Task.new(
        name: "Définition du projet",
        description: @project.description,
        category: "Catégorie par défaut",
        progress: 0,
        budget: @project.customer_budget,
        start_at: @project.initial_start_at,
        end_at: @project.initial_end_at,
        project_id: @project.id
      )
      if @task.save
        client_name = @project.customer.name
        @message = Message.new(content: "Bonjour #{client_name}, dans ce chat, nous pourrons échanger à propos de votre projet!")
        @message.user = @user
        @message.chatroom = @chatroom
        @message.save

        redirect_to projects_path, notice: 'Le projet a été créé avec succès.'
      else
        render :new, status: :unprocessable_entity
      end
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
    params.require(:project).permit(:id, :title, :description, :address, :initial_start_at, :initial_end_at, :progress, :customer_budget, :total_expenses, :customer_id, :photo, :project_tags)
  end

  def progress_calcul(project)
    tasks_project = project.tasks
    tasks_progress = []
    tasks_project.each do |task|
      tasks_progress << task.progress
    end
    progress = tasks_progress.sum / tasks_progress.length
    return progress
  end

  def expenses_calcul(project)
    tasks_project = project.tasks
    total_expenses = 0
    tasks_project.each do |task|
      total_expenses += task.budget * task.progress / 100
    end
    return total_expenses
  end

end
