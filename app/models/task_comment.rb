class TaskComment < ApplicationRecord
  include PublicActivity::Model
  tracked owner: Proc.new{ |controller, model| controller.current_user }, recipient: :task, :params => {comment: :comment}

  belongs_to :user
  belongs_to :task, counter_cache: true

  # Validation
  validates :comment, presence: true, length: { minimum: 2 }
end
