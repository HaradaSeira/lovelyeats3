class Item < ApplicationRecord
  mount_uploader :image, ImageUploader
  
  belongs_to :user
  has_many :event_items
  has_many :events, through: :event_items
  has_and_belongs_to_many :shops
  
end
