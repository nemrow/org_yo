class DiscussionsResponsesController < ApplicationController
  def create
    p params
    discussion = Discussion.find(params[:discussion_id])
    @discussion_response = DiscussionResponse.new
    if @discussion_response.save
      discussion.discussion_responses << @discussion_response
      current_user.discussion_responses << @discussion_response
      render :partial => 'discussions_responses/discussion_response_template'
    else
      # failure
    end
  end

  def update
    p 'params = '
    p params
    @discussion_response = DiscussionResponse.find(params[:id])
    @discussion_response.update_attributes(params[:discussion_response_data])
    p 'discussionresponse'
    p @discussion_response
    render :partial => 'discussions_responses/indi_show', :locals => {:response => @discussion_response}
  end
end
