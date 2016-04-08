module API
  module PositionSystem
    module V1
      class Session < Grape::API
        resources "position_system/sessions" do
          params do
            requires :login, type: String, desc: '为设备的唯一身份码，使用GSM模块的IMEI号码，长度为15位'
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
