class TaskComment < ApplicationRecord
  belongs_to :user
  belongs_to :task, counter_cache: true

  # Validation
  validates :comment, presence: true, length: { minimum: 10 }
end
