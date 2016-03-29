class PositionSystem::Device < ActiveRecord::Base
  has_many  :logs, :class_name => 'PositionSystem::Log'

end
