# DEBUG = true
# MANUAL_ONLY = true
START_TIME = Time.local(2014,6,2,20)
END_TIME = Time.local(2014,6,3,20)
MAX_AGE = 8
MIN_PRICE = 80
BLACKLISTED_IDS = [
  # Driven
  '100004025651186', # GTI
  '100003967135212', # S2000
  '100004027211186', # Z435i
] + [
  # Too far
  '100003954075479', # Golf R
] + [
  # Limited mileage
  '100004047501186', # 640i
  '100004028681188', # C250
] + [
  # No response
  '100004064921187', '100004062531189', '100003954090380', '100004079111185', '100004042281187', '100004032221185', '100003977437187', '100004039311186',
] + [
  # Slow cars
  '100003941496344', '100004084441185', '100004094671187', '2901', '100004094511189',
]
BLACKLISTED_MODELS = [
  # Not so slow cars
  '1 Series',
  '3 Series',
  '5 Series',
  'Camaro',
  'Challenger',
  'IS 350',
  'G Coupe',
  'G Sedan',
  'G37',
  'GS 450h',
] + [
  # Slow cars
  '4Runner',
  'A4',
  'A6',
  'Accord',
  'Altima',
  'Avalon Hybrid',
  'C-Max Energi',
  'Camry Hybrid',
  'Camry',
  'CC',
  'Charger',
  'Cherokee',
  'Civic',
  'CLK-Class',
  'Compass',
  'Corolla',
  'CR-V',
  'CT 200h',
  'Edge',
  'Elantra',
  'Eos',
  'Escalade EXT',
  'Fit',
  'FJ Cruiser',
  'fortwo',
  'Fusion',
  'G6',
  'Grand Cherokee',
  'ILX',
  'Insight',
  'IS 250',
  'Jetta',
  'M-Class',
  'M35',
  'Malibu',
  'MAZDA3',
  'MAZDA6',
  'MKT',
  'Model S',
  'Optima',
  'Outback',
  'Passat',
  'Prius c',
  'Prius Plug-in',
  'Prius',
  'Q5',
  'Q50',
  'Ridgeline',
  'RX 350',
  'S40',
  'Santa Fe',
  'Sentra',
  'Sienna',
  'Sonata Hybrid',
  'Sonata',
  'Spectra',
  'Tacoma',
  'Tahoe',
  'Terrain',
  'Tiguan',
  'Touareg',
  'TSX',
  'Versa',
  'Volt',
  'X1',
  'Xterra',
  'XV Crosstrek',
]

require 'time'
require 'net/http'
require 'json'

# Get
url = 'http://index.getaround.com/v1.0/search?viewport=37.632137,-122.606249,37.873299,-122.287233&properties=car_id,car_name,car_photo,carkit_enabled,distance,instant_rental,latitude,longitude,make,model,price_daily,price_hourly,price_weekly,total_price,timezone,year'
url += '&page_size=200' if defined?(DEBUG)
url += "&start_time=#{START_TIME.utc.iso8601}&end_time=#{END_TIME.utc.iso8601}" if defined?(START_TIME) && defined?(END_TIME)
url += '&transmission=manual' if defined?(MANUAL_ONLY)
uri = URI(url)
response = Net::HTTP.get(uri)
json = JSON.parse(response)
cars = json['cars']

# Filter
cars = cars.reject { |car| BLACKLISTED_IDS.include?(car['car_id']) }
cars = cars.reject { |car| BLACKLISTED_MODELS.include?(car['model']) }
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
