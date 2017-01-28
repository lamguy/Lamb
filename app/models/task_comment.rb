class TaskComment < ApplicationRecord
  include PublicActivity::Model
  tracked owner: proc {|controller, model_instance| controller.current_user }, recipient: :task, :params => {
      :user_id => proc {|controller, model_instance| controller.current_user.id },
      :user_name => proc {|controller, model_instance| controller.current_user.name },
      :task_id => proc {|controller, model_instance| model_instance.task.id},
      :task_name => proc {|controller, model_instance| model_instance.task.name},
      :comment => :comment
  }

  belongs_to :user
  belongs_to :task, counter_cache: true

  # Validation
  validates :comment, presence: true, length: { minimum: 2 }
end
