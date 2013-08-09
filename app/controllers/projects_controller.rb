class ProjectsController < ApplicationController
  def new
    @project = Project.new
  end

  def create
    user = User.find(current_user)
    project = Project.new(params[:project])
    if project.save
      user.owned_projects << project
      redirect_to project_path(project)
    else
      redirect_to root_path
    end
  end

  def show
    @project = Project.find(params[:id])
    @discussions = @project.discussions
  end

  def update
    project = Project.find(params[:id])
    if project.update_attributes(params[:project_data])
      render json: {response: true}
    else
      render json: {response: false}
    end
  end
end
