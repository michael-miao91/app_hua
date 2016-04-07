class PositionSystems::UserProfile < ActiveRecord::Base
  belongs_to  :device, :class_name => 'PositionSystems::Device'
end
