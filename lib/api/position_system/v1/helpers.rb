module API
  module PositionSystem
    module V1
      module Helpers
        def current_device
          @current_device ||= PositionSystems::Device.find_by_sim_number_and_serial_number(params[:sim_number], params[:serial_number])
        end

        def authenticate!
          error!({ 'error' => '401 Unauthorized' }, 401) unless current_device
        end

        def error_404!
          error!({ 'error' => 'Page not found' }, 404)
        end

      end
    end
  end
end