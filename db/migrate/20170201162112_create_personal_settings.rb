class CreatePersonalSettings < ActiveRecord::Migration[5.0]
  def change
    create_table :personal_settings do |t|
      t.references :user, foreign_key: true
      t.string :setting_key, null: false, index: true, unique: true
      t.string :setting_value, null: false, index: true, unique: true

      t.timestamps
    end
  end
end
