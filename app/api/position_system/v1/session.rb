class PositionSystem::V1::Session < Grape::API
  resources "position_system/sessions" do
    params do
      requires :login, type: String
      requires :password, type: String
    end
    post do
      status 200
      device = PositionSystem::Device.find_by_sim_number_and_serial_number(params[:login],params[:password])
      if device.present?
        {success: true}
      else
        {error: 'wrong username or password'}
      end
    end
  end
end
