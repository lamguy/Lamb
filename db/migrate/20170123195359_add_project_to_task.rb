class AddProjectToTask < ActiveRecord::Migration[5.0]
  def change
    add_reference :tasks, :project, foreign_key: true, after: :id
  end
end
