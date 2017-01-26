class CreateProjectTeams < ActiveRecord::Migration[5.0]
  def change
    create_table :project_teams do |t|
      t.references :project, null: false, default: 0, foreign_key: true
      t.references :team, null: false, default: 0, foreign_key: true
      t.references :role, null: false, default: 0, foreign_key: true

      t.timestamps
    end
  end
end
