class AddPriorityToTasks < ActiveRecord::Migration[5.0]
  def change
    add_column :tasks, :priority, :integer, null: false, default: 0, after: :due
  end
end
