module API
  module PositionSystem
    module V1
      class ClientApp < Grape::API
        resource "position_system" do
          params do
            requires :serial_number, type: String, desc: '为设备的唯一身份码，使用GSM模块的IMEI号码，长度为15位'
          end
          before do
            authenticate!
          end
          resource "device" do
            get "/current_position" do
              # {
              #     status: "success",
              #     code: 1,
              #     data:
              # }
              pp @current_device
              present @current_device.current_position, with: PositionSystem::V1::Entities::CurrentPosition
            end

            params do
              requires :phone_number, type: String, regexp: /^0?1[3|4|5|7|8][0-9]\d{8}$/, desc: 'apk获取到对应的手机号码'
            end
            post "/phone_number" do
              status 200
              PositionSystems::UserProfile.create(device_id: @current_device.id, phone_number: params[:phone_number])
              {
                  "status": "success", code: 1
              }
            end

            params do
              requires :by_day, type: String, desc: '指定要获取哪天的记录,例如: 2016-03-29'
            end
            get "/position_logs" do
                # {
                #     status: "success",
                #     code: 1,
                #     data: @current_device.logs.where(created_at: params[:by_day].to_datetime.beginning_of_day..params[:by_day].to_datetime.end_of_day), with: PositionSystem::V1::Entities::Log
                # }
              present @current_device.logs.where(created_at: params[:by_day].to_datetime.beginning_of_day..params[:by_day].to_datetime.end_of_day), with: PositionSystem::V1::Entities::Log
            end
          end

        end
      end
    end
  end
end

