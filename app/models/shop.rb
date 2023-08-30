class Shop < ApplicationRecord
  mount_uploader :image, ImageUploader
  
  has_many :events
  
  belongs_to :user
end
