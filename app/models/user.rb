class User < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name, :password
  has_and_belongs_to_many :projects, :join_table => 'users_projects'
  has_many :users_projects
  has_many :owned_projects, :class_name => 'Project'
  has_many :discussions
  has_many :discussion_responses
  has_secure_password
end
