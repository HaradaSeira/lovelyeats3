class Shop < ApplicationRecord
  mount_uploader :image, ImageUploader
  
  has_many :events
  has_many :items
  
  belongs_to :user
end
