class TaskComment < ApplicationRecord
  belongs_to :user
  belongs_to :task

  # Validation
  validates :comment, presence: true, length: { minimum: 10 }
end
