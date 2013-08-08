class Discussion < ActiveRecord::Base
  attr_accessible :content, :title
  belongs_to :project
  has_many :discussion_responses
end
