class PositionSystems::DevicesController < ApplicationController
  def show
    device = PositionSystems::Device.find(params[:id])
    @device_log = device.logs.order(created_at: :desc)
  end
end