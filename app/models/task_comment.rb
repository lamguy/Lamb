class TaskComment < ApplicationRecord
  include PublicActivity::Model
  tracked

  belongs_to :user
  belongs_to :task, counter_cache: true

  # Validation
  validates :comment, presence: true, length: { minimum: 2 }
end
