class CreateTeamMembers < ActiveRecord::Migration[5.0]
  def change
    create_table :team_members do |t|
      t.belongs_to :team, index: true
      t.belongs_to :user, index: true

      t.references :role

      t.timestamps
    end
  end
end
