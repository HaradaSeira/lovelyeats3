class Event < ApplicationRecord
  belongs_to :shop
  belongs_to :location
end
