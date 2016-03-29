module V1
  class PositionSystem::Device < Grape::API
    resource "position_system/device" do
      params do
        requires :data, type: String
      end
      post "" do
        status 200
        puts "data=======", params[:data]
        {success: true}
      end
    end
  end
end
