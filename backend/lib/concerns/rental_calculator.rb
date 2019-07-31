module RentalCalculator
  def calculate_price rental, discount_rules: []
    if discount_rules.present?
      calculate_price_with_discount_rules rental, discount_rules
    else
      rental_days_count(rental) * rental.car.price_per_day + rental.distance * rental.car.price_per_km
    end
  end

  def rental_days_count rental
    (Date.parse(rental.end_date) - Date.parse(rental.start_date)).to_i + 1
  end

  def calculate_price_with_discount_rules rental, discount_rules
    rental_days = rental_days_count rental
    price_days = 0
    discount_rules.each do |rule|
      next if rental_days <= rule.rental_days

      price_days += rental.car.price_per_day * (100 - rule.discount_percent) / 100 * (rental_days - rule.rental_days)
      rental_days = rule.rental_days
    end
    price_days += rental.car.price_per_day * rental_days

    price_days + rental.distance * rental.car.price_per_km
  end
end
