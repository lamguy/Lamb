class AlterStatusInProjects < ActiveRecord::Migration[5.0]
  def change
    change_column :projects, :name, :string, :default => "", :null => false
    change_column :projects, :status, :integer, :default => 1, :null => false
  end
end
