class CreateMilestones < ActiveRecord::Migration[5.0]
  def change
    create_table :milestones do |t|
      t.references :project, foreign_key: true
      t.string :name
      t.string :description
      t.date :due

      t.timestamps
    end
  end
end
