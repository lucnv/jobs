module RentalCalculator
  COMMISSION = {
    percent_on_price: 30,
    insurance_percent: 50,
    roadside_assistance: 100
  }

  def calculate_price rental, discount_rules: []
    if discount_rules.present?
      calculate_price_with_discount_rules rental, discount_rules
    else
      rental_days_count(rental) * rental.car.price_per_day + rental.distance * rental.car.price_per_km
    end
  end

  def calculate_commission rental, price
    total_commission = price * COMMISSION[:percent_on_price] / 100
    insurance_fee = total_commission * COMMISSION[:insurance_percent] / 100
    assistance_fee = rental_days_count(rental) * COMMISSION[:roadside_assistance]
    {
      insurance_fee: insurance_fee,
      assistance_fee: assistance_fee,
      drivy_fee: total_commission - insurance_fee - assistance_fee
    }
  end

  private
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
