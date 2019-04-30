class Like < ApplicationRecord

  belongs_to :user
  belongs_to :coordinate

  validates :user_id, presence: true
  validates :coordinate_id, presence: true
end
