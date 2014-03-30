# DEBUG = true
MAX_AGE = 8
MIN_PRICE = 80
DESCRIPTION_TOO_ANAL = [
  '100004047501186',
]
NO_RESPONSE = [
  '100004064921187',
  '100004062531189',
  '100003954090380',
]
DRIVEN = [
  '100003967135212', # S2000
  '100004027211186', # Z435i
]
BLACK_LIST = [
  # Fast cars
  '1 Series',
  '3 Series',
  '5 Series',
  '500',
  'Camaro',
  'Challenger',
  'Cooper',
  'IS 350',
  'G Coupe',
  'G37',
  'GTI',
] + [
  # Slow cars
  'A4',
  'A6',
  'Accord',
  'Altima',
  'Avalon Hybrid',
  'C-Class',
  'Camry',
  'Camry Hybrid',
  'CC',
  'Charger',
  'Civic',
  'CLK-Class',
  'Corolla',
  'Elantra',
  'Eos',
  'Fit',
  'fortwo',
  'Fusion',
  'G6',
  'ILX',
  'Insight',
  'IS 250',
  'Jetta',
  'M35',
  'Malibu',
  'MAZDA3',
  'MAZDA6',
  'Model S',
  'Passat',
  'Prius',
  'Prius c',
  'Q50',
  'S40',
  'Sentra',
  'Sonata',
  'Sonata Hybrid',
  'Spectra',
  'TSX',
  'Versa',
]

require 'json'
require 'net/http'

# Get
url = 'http://index.getaround.com/v1.0/search?user_lat=37.71084&user_lng=-122.39018099999998&viewport=37.632137%2C-122.606249%2C37.873299%2C-122.287233&body_style=coupe%2Csedan%2Chatchback%2Cconvertible&properties=car_id,car_name,car_photo,carkit_enabled,distance,instant_rental,latitude,longitude,make,model,price_daily,price_hourly,price_weekly,total_price,timezone,year&sort=best&page_sort=magic'
url += '&page_size=200' if defined?(DEBUG)
uri = URI(url)
response = Net::HTTP.get(uri)
json = JSON.parse(response)
cars = json['cars']

# Filter
cars = cars.reject { |car| DESCRIPTION_TOO_ANAL.include?(car['car_id']) }
cars = cars.reject { |car| NO_RESPONSE.include?(car['car_id']) }
cars = cars.reject { |car| DRIVEN.include?(car['car_id']) }
cars = cars.reject { |car| BLACK_LIST.include?(car['model']) }
cars = cars.select { |car| car['price_daily'].to_i > MIN_PRICE }
cars = cars.select { |car| car['year'].to_i > Time.now.year - MAX_AGE }

# Sort
cars = cars.sort_by { |car| [car['price_daily'].to_i, car['year'].to_i] }

# Print
p "-- #{cars.count} cars out of #{json['cars'].count} --"
cars.each do |car|
  price = "$#{car['price_daily'][0..-4].ljust(6)}"
  year = "'#{car['year'][2..-1]}"
  make_model = "#{car['make']} #{car['model']}".ljust(30)
  url = "http://www.getaround.com/_?carid=#{car['car_id']}"
  is_instant = 'instant' if car['instant_rental']

  p "#{price} #{year} #{make_model} #{url} #{is_instant}"
end
