class CreateTaskAssets < ActiveRecord::Migration[5.0]
  def change
    create_table :task_assets do |t|
      t.references :task, foreign_key: true
      t.references :user, foreign_key: true
      t.string :file_name
      t.string :file_conten_type
      t.string :file_size

      t.timestamps
    end
  end
end
