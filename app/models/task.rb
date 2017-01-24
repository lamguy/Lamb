class Task < ApplicationRecord
  include Priority
  
  belongs_to :project
  has_many :task_metas

  belongs_to :assigner, :class_name => 'User'
  belongs_to :assignee, :class_name => 'User'
end
