class Discussion < ActiveRecord::Base
  attr_accessible :content, :title
  belongs_to :project
  belongs_to :user
  has_many :discussion_responses
  
  default_scope order('created_at DESC')
end
