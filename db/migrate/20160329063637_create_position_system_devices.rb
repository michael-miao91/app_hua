class CreatePositionSystemDevices < ActiveRecord::Migration
  def change
    create_table :position_system_devices do |t|
      t.string  :serial_number
      t.string  :sim_number

      t.timestamps null: false
    end
  end
end
