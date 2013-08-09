class DiscussionsController < ApplicationController
  def create
    p params
    project = Project.find(params[:project_id])
    @discussion = Discussion.new
    if @discussion.save
      project.discussions << @discussion
      current_user.discussions << @discussion
      render :partial => 'discussions/discussion_init'
    else
      # failure
    end
  end

  def new
    @discussion = Discussion.new
  end

  def update
    @discussion = Discussion.find(params[:id])
    @discussion.update_attributes(params[:discussion_data])
    render :partial => 'discussions/discussion_thumb', :locals => {:discussion => @discussion}
  end

  def show
    @discussion = Discussion.find(params[:id])
  end

  def destroy
  end
end
