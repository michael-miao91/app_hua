class PositionSystems::Device < ActiveRecord::Base
  has_many  :logs, :class_name => 'PositionSystems::Log'
  has_one   :current_position, :class_name => 'PositionSystems::CurrentPosition'
  has_many  :user_profiles, :class_name => 'PositionSystems::UserProfile'



  def update_current_position(lat, lng)
    if self.current_position.present?
      self.current_position.update_attributes(lat: lat, lng: lng)
    else
      PositionSystems::CurrentPosition.create(device_id: self.id, lat: lat, lng: lng)
    end

  end
end
