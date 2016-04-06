class CreatePositionSystemPhoneNumberTemps < ActiveRecord::Migration
  def change
    create_table :position_system_phone_number_temps do |t|
      t.string  :phone_number

      t.timestamps null: false
    end
  end
end
