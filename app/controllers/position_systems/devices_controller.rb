class PositionSystems::DevicesController < ApplicationController
  def show
    device = PositionSystems::Device.find(params[:id])
    @device_log = device.logs.order(created_at: :desc)
  end
  def map
    device = PositionSystems::Device.find(params[:id])
    @current_position = device.current_position
  end
end