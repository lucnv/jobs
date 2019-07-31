require "../config/setup"

include JsonHelper
include RentalCalculator

json_data = parse_data_from_json_file "./data/input.json"

Car.data = json_data[:cars]
Rental.data = json_data[:rentals]

discount_rules = DiscountRule.all.sort_by { |rule| - rule.rental_days }

rental_result = Rental.all.map do |rental|
  price =  calculate_price rental, discount_rules: discount_rules
  commission = calculate_commission rental, price
  {
    id: rental.id,
    price: price,
    commission: commission
  }
end

hash_output = { rentals: rental_result }
write_hash_to_json_file "./data/output.json", hash_output
