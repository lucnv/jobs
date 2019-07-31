class Car < ActiveHash::Base
  include ActiveHash::Associations

  has_many :rentals

  field :id
  field :price_per_day
  field :price_per_km
end
