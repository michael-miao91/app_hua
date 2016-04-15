module API
  module PositionSystem
    module V1
      module Helpers
        def current_device
          @current_device ||= PositionSystems::Device.find_by_serial_number(params[:serial_number])
        end

        def authenticate!
          error!({status: "error", code: 0, msg:  "401 Unauthorized"}, 401) unless current_device
        end

        def error_404!
          error!({status: "error", code: 0, msg:  "Page not found"}, 404)
        end

      end
    end
  end
end
