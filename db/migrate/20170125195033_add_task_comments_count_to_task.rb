class AddTaskCommentsCountToTask < ActiveRecord::Migration[5.0]
  def change
    add_column :tasks, :task_comments_count, :integer, default: 0, after: :priority
  end
end
