class DiscussionsResponsesController < ApplicationController
  def create
    p params
    discussion = Discussion.find(params[:discussion_id])
    @discussion_response = DiscussionResponse.new
    if @discussion_response.save
      discussion.discussion_responses << @discussion_response
      render :partial => 'discussions_responses/discussion_response_template'
    else
      # failure
    end
  end
end
