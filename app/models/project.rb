class Project < ActiveRecord::Base
  attr_accessible :name
  has_and_belongs_to_many :collaborators, :join_table => 'users_projects', :class_name => 'User'
  has_many :users_projects
  belongs_to :creator, :class_name => 'User'
  has_many :discussions

  default_scope order('updated_at DESC')
end
