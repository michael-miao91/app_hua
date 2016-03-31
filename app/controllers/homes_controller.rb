class HomesController < ApplicationController
  def index
    @devices = PositionSystem::Device.all
  end
end