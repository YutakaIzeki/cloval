class Coordinate < ApplicationRecord

  validates :image, presence: true

  belongs_to :user
  mount_uploader :image, CoordinateUploader

  def update_coordinate_and_user_evaluation(add_point)
    self.evaluation_value += add_point.to_i
    self.evaluation_number += 1
    self.user.score += add_point.to_i

    # ユーザーのランクを判定
    case self.user.score
    when 0..5
      self.user.rank = 3
    when 5..20
      self.user.rank = 2
    else
      self.user.rank = 1
    end

    self.user.save
    self.save    
  end

end
