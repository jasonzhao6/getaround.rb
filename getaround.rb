# DEBUG = true
# MANUAL_ONLY = true
# CONVERTIBLE_ONLY = true
START_TIME = Time.local(2014,5,3,8)
END_TIME = Time.local(2014,5,3,20)
MAX_AGE = 8
MIN_PRICE = 80
BLACKLISTED_IDS = [
  # Driven
  '100004025651186', # GTI
  '100003967135212', # S2000
  '100004027211186', # Z435i
  '100004030001192', # Cooper S
] + [
  # Too far
  '100003954075479', # Golf R
  '100004090201185', # M Roadster
] + [
  # Limited mileage
  '100004047501186', # 640ic
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
  'Eos',
  'G Coupe',
  'G Sedan',
  'G37',
  'GS 450h',
  'IS 350',
  'Mustang',
] + [
  # Slow cars
  '4Runner',
  'A4',
  'A6',
  'Accord',
  'Altima',
  'Avalon Hybrid',
  'C-Max Energi',
  'C70',
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
  'CX-5',
  'Edge',
  'Elantra',
  'Escalade EXT',
  'Escape',
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
  'Odyssey',
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

# Validate
if defined?(START_TIME) && defined?(END_TIME)
  DAY_IN_SECONDS = 60 * 60 * 24
  DAYS_ALLOWED_BY_SEARCH = 40
  days_ahead = ((END_TIME - Time.now) / DAY_IN_SECONDS).round
  if days_ahead > DAYS_ALLOWED_BY_SEARCH
    p "ERROR: Checking #{days_ahead} days into the future. Limit is #{DAYS_ALLOWED_BY_SEARCH} days."
    exit
  end
end

# Get
url = 'http://index.getaround.com/v1.0/search?viewport=37.632137,-122.606249,37.873299,-122.287233&properties=car_id,car_name,car_photo,carkit_enabled,distance,instant_rental,latitude,longitude,make,model,price_daily,price_hourly,price_weekly,total_price,timezone,year'
url += "&start_time=#{START_TIME.utc.iso8601}&end_time=#{END_TIME.utc.iso8601}" if defined?(START_TIME) && defined?(END_TIME)
url += '&page_size=200' if defined?(DEBUG) && DEBUG
url += '&transmission=manual' if defined?(MANUAL_ONLY) && MANUAL_ONLY
url += '&body_style=convertible' if defined?(CONVERTIBLE_ONLY) && CONVERTIBLE_ONLY
uri = URI(url)
response = Net::HTTP.get(uri)
response = Net::HTTP.get(uri) while response =~ /Internal Server Error/
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
  has_carkit = 'carkit' if car['carkit_enabled']

  p "#{price} #{year} #{make_model} #{url} #{has_carkit} #{is_instant}"
end
