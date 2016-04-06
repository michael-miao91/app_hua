class PositionSystem::Device < ActiveRecord::Base
  has_many  :logs, :class_name => 'PositionSystem::Log'
  has_one   :current_position, :class_name => 'PositionSystem::CurrentPosition'
  has_many  :user_profiles, :class_name => 'PositionSystem::UserProfile'



  def update_current_position(lat, lng)
    if self.current_position.present?
      self.current_position.update_attributes(lat: lat, lng: lng)
    else
      PositionSystem::CurrentPosition.create(device_id: self.id, lat: lat, lng: lng)
    end

  end
end
