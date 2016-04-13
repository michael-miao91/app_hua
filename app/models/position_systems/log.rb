class PositionSystems::Log < ActiveRecord::Base
  belongs_to  :device, :class_name => 'PositionSystems::Device'
  #lat 维度是小的 -90~90
  #lng 经度大  -180~180
  
end
