module API
  module PositionSystem
    module V1
      class Session < Grape::API
        resources "position_system/sessions" do
          params do
            requires :login, type: String
            # requires :password, type: String
          end
          post do
            status 200
            device = PositionSystems::Device.find_by_serial_number(params[:login])
            if device.present?
              {success: true}
            else
              {error: 'wrong login'}
            end
          end
        end
      end
    end
  end
end
