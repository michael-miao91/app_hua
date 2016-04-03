class V1::PositionSystem::Device < Grape::API
  resource "position_system/device" do
    params do
      requires :data, type: String
    end

    post "", serializer: ::PositionSystem::Device  do
      status 200
      obj_arr = params[:data].split(",")
      device = PositionSystem::Device.find_or_create_by(serial_number: obj_arr[0], sim_number: obj_arr[1])
      # lat = obj_arr[3][0..1] + "." + obj_arr[3][2..-1]
      # lng = obj_arr[2][0..2] + "." + obj_arr[2][3..-1]
      lat = obj_arr[3]
      lnt = obj_arr[2]
      PositionSystem::Log.create(lng: lng, lat: lat, device_id: device.id)

      {success: true}
    end
  end
end
