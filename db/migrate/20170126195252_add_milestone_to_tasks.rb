class AddMilestoneToTasks < ActiveRecord::Migration[5.0]
  def change
    add_reference :tasks, :milestone, foreign_key: true
  end
end
