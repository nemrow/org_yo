class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.new(params[:user])
    if user.save
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      redirect_to new_user_path
    end
  end

  def show
    @user = current_user
    @owned_projects = @user.owned_projects
    @projects = @user.projects
  end
end
