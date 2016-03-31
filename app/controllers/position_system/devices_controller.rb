class PositionSystem::DevicesController < ApplicationController
  def show
    device = PositionSystem::Device.find(params[:id])
    @device_log = device.logs
  end
end