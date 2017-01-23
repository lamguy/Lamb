class CreateTaskMeta < ActiveRecord::Migration[5.0]
  def change
    create_table :task_meta do |t|
      t.references :project, foreign_key: true
      t.string :name, unique: true
      t.string :label
      t.string :default_value

      t.timestamps
    end
  end
end
