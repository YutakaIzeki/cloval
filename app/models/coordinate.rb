class Coordinate < ApplicationRecord

  belongs_to :user
  mount_uploader :image, CoordinateUploader
end
