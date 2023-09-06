class Event < ApplicationRecord
  belongs_to :shop
  belongs_to :location
  
   # カラム名と属性名を一致させる
  attribute :opened_at, :datetime
  attribute :closed_at, :datetime
  attribute :shop_id, :integer
  attribute :location_id, :integer
  attribute :address, :string
  attribute :created_at, :datetime
  attribute :updated_at, :datetime
  
end
