class Coordinate < ApplicationRecord

  # バリデーション
  validates :image, presence: true

  # アソシエーション
  belongs_to :user
  has_many :likes, dependent: :destroy

  has_many :like_users, through: :likes, source: :user

  # アップローダのマウント
  mount_uploader :image, CoordinateUploader

  # コーディネートの評価とユーザのランクのアップデート
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

  def like(user)
    self.likes.create(user_id: user.id)
  end

  def unlike(user)
    self.likes.find_by(user_id: user.id).destroy
  end

  # 現在のユーザがいいねしていたらtrueを返す
  def like?(user)
    self.like_users.include?(user)
  end

end
