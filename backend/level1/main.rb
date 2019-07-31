require "../config/setup"

json_data = JSON.parse File.read "./data/input.json"

Car.data = json_data["cars"]
Rental.data = json_data["rentals"]

rental_result = Rental.all.map do |rental|
  rental_days = (Date.parse(rental.end_date) - Date.parse(rental.start_date)).to_i + 1
  price =  rental_days * rental.car.price_per_day + rental.distance * rental.car.price_per_km
  { id: rental.id, price: price }
end

output = { rentals: rental_result }
File.open "./data/output.json", "w" do |f|
 f.write JSON.pretty_generate output
end
