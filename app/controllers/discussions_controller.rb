class DiscussionsController < ApplicationController
  def create
    project = Project.find(params[:project_id])
    @discussion = Discussion.new
    if @discussion.save
      project.discussions << @discussion
      render :partial => 'discussions/discussion_template'
    else
      # failure
    end
  end

  def update
  end

  def show
  end

  def destroy
  end
end
