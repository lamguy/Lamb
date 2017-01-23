class CreateTaskMetaData < ActiveRecord::Migration[5.0]
  def change
    create_table :task_meta_data do |t|
      t.references :task_meta, foreign_key: true
      t.string :value, index: true

      t.timestamps
    end
  end
end
