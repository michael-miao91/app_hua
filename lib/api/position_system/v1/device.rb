module API
  module PositionSystem
    module V1
      class Device < Grape::API
        resource "position_system/device" do
          params do
            requires :data, type: String
          end

          post do
            status 200
            obj_arr = params[:data].split(",")
            device = PositionSystems::Device.find_or_create_by(serial_number: obj_arr[0], sim_number: obj_arr[1])
            # lat = obj_arr[3][0..1] + "." + obj_arr[3][2..-1]
            # lng = obj_arr[2][0..2] + "." + obj_arr[2][3..-1]
            lat = obj_arr[3]
            lng = obj_arr[2]
            PositionSystems::Log.create(lng: lng, lat: lat, device_id: device.id)
            device.update_current_position(lng, lat)

            {success: true}
          end
        end
      end
    end
  end
end

