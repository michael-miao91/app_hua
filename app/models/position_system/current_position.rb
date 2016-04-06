class PositionSystem::CurrentPosition < ActiveRecord::Base
  belongs_to  :device, :class_name => 'PositionSystem::Device'
end
