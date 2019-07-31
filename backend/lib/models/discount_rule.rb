class DiscountRule < ActiveHash::Base
  self.data = [
    { rental_days: 1, discount_percent: 10 },
    { rental_days: 4, discount_percent: 30 },
    { rental_days: 10, discount_percent: 50 },
  ]
end
