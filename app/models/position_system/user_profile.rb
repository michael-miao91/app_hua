class PositionSystem::UserProfile < ActiveRecord::Base
  belongs_to  :device, :class_name => 'PositionSystem::Device'
end
