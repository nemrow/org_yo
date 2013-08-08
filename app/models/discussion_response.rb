class DiscussionResponse < ActiveRecord::Base
  attr_accessible :content, :discussion_id
  belongs_to :discussion
end
