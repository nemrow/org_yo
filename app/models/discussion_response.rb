class DiscussionResponse < ActiveRecord::Base
  attr_accessible :content, :discussion_id
  belongs_to :discussion
  belongs_to :user

  default_scope order('created_at DESC')
end
