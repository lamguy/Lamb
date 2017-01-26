class Task < ApplicationRecord
  include Tasks::Priority
  include Tasks::Description
  
  belongs_to :project
  belongs_to :milestone
  
  has_many :task_comments
  has_many :task_metas

  belongs_to :assigner, :class_name => 'User'
  belongs_to :assignee, :class_name => 'User'

  def get_comment_count(count)
    if(!count)
      0
    else
      count
    end
  end
end
