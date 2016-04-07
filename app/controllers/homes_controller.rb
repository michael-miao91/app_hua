class HomesController < ApplicationController
  def index
    @devices = PositionSystems::Device.all
  end
end