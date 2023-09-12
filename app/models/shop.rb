class Shop < ApplicationRecord
  mount_uploader :image, ImageUploader
  
  has_many :events
  has_and_belongs_to_many :items
  belongs_to :user
end
