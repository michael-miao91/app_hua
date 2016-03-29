class CreatePositionSystemLogs < ActiveRecord::Migration
  def change
    create_table :position_system_logs do |t|
      t.integer :device_id
      t.string  :lat  #维度
      t.string  :lng  #经度

      t.timestamps null: false
    end
  end
end
