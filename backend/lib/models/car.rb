class Car < BaseRecord
  has_many :rentals

  field :id
  field :price_per_day
  field :price_per_km
end
