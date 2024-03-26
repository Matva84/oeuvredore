class UsersController < ApplicationController

  def edit
  end

  def update
    puts "CECI EST LA FONCTION UPDATE DE USER CONTROLLER"
    @customer = User.find(params[:id])
    @customer.name = params[:user][:name]
    @customer.address = params[:user][:address]
    @customer.email = params[:user][:email]
    @customer.phone = params[:user][:phone]
    @customer.save
    @project = Project.find(params[:project_id])
    redirect_to project_path(@project.id), notice: 'Coordonnées actualisées.'
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :address, :phone)
  end

end
