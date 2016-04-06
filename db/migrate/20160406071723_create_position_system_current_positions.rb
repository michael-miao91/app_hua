class CreatePositionSystemCurrentPositions < ActiveRecord::Migration
  def change
    create_table :position_system_current_positions do |t|
      t.integer :device_id
      t.string  :lat
      t.string  :lng

      t.timestamps null: false
    end
  end
end
