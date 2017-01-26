class AddPowerToRoles < ActiveRecord::Migration[5.0]
  def change
    add_column :roles, :power, :int, null: false, default: 0, :after => :name
  end
end
