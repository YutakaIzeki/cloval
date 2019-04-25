class Coordinate < ApplicationRecord

  belongs_to :user
  mount_uploader :image, CoordinateUploader

  def update_coordinate_and_user_evaluation(add_point)
    self.evaluation_value += add_point.to_i
    self.evaluation_number += 1
    self.user.score += add_point.to_i
    self.user.save
    self.save    
  end

end
