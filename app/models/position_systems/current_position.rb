class PositionSystems::CurrentPosition < ActiveRecord::Base
  belongs_to  :device, :class_name => 'PositionSystems::Device'
end
