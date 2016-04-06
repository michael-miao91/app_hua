class V1::PositionSystem::ClintApp < Grape::API
  resource "position_system" do
    params do
      requires :sim_number, type: String
      requires :serial_number, type: String
    end
    before do
      authenticate!
    end
    resource "device" do
      get "/current_position", serializer: ::PositionSystem::CurrentPosition  do
        present @current_device.current_position, with: V1::PositionSystem::Entities::CurrentPosition
      end

      params do
        requires :phone_number,   type: String
      end
      post "/phone_number", serializer: ::PositionSystem::UserProfile do
        status 200
        PositionSystem::UserProfile.create(device_id: @current_device.id, phone_number: params[:phone_number])
        {success: true}
      end

      params do
        requires :by_day,   type: String
      end
      get "/position_logs", serializer: ::PositionSystem::CurrentPosition  do
        present @current_device.logs.where(created_at: params[:by_day].to_datetime.beginning_of_day..params[:by_day].to_datetime.end_of_day), with: V1::PositionSystem::Entities::Log
      end
    end

  end
end
