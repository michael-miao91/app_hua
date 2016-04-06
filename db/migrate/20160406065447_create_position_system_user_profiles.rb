class CreatePositionSystemUserProfiles < ActiveRecord::Migration
  def change
    create_table :position_system_user_profiles do |t|
      t.integer :device_id
      t.string  :phone_number

      t.timestamps null: false
    end
  end
end
