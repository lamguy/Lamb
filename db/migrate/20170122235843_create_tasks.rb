class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.string :name
      t.date :due

      t.timestamps
    end

    add_reference :tasks, :assigner, references: :users, index: true, after: :name
    add_reference :tasks, :assignee, references: :users, index: true, after: :assigner_id
  end
end
