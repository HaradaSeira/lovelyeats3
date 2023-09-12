class Event < ApplicationRecord
  belongs_to :shop
  belongs_to :location
  has_many :event_items # 中間テーブル
  has_many :items, through: :event_items  # 中間テーブル
  
   # カラム名と属性名を一致させる
  attribute :opened_at, :datetime
  attribute :closed_at, :datetime
  attribute :shop_id, :integer
  attribute :location_id, :integer
  attribute :address, :string
  attribute :created_at, :datetime
  attribute :updated_at, :datetime
  
end
