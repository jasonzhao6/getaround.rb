# DEBUG = true
# MANUALS_ONLY = true
# CONVERTIBLES_ONLY = true
FOR_JASON_ONLY = true
# START_TIME = Time.local(2015,6,19,14,00)
# END_TIME = Time.local(2015,6,21,18,30)
MAX_AGE = 15
MIN_PRICE = 70
blacklisted_ids = []
blacklisted_ids += [
  # Driven
  '100004025651186', # '13 GTI $62
  '100003967135212', # '08 S2000 $91 + $137
  '100004027211186', # '14 Z435i $251
  '100004030001192', # '10 Cooper S $177
  '100004081211185', # '13 500 Abarth $225
  '100004140221190', # '13 STI $201
  '100004263631187', # '14 C7 Stingray $266
  '100004027131187', # '14 911 Cab $301
  '100004298771185', # '10 R8 $781
  '100004317911185', # '11 M3 $160
  '100004392791188', # '09 Cayman $136
  '100004316571185', # '12 SLK 350 $156
  '100004449271186', # '15 FRS RS 1.0 $66
  '100004608641187', # '15 GTI $97
  '100004492541185', # '15 M4 %251
] if defined?(FOR_JASON_ONLY) && FOR_JASON_ONLY
blacklisted_ids += [
  # Slow cars
  '100004454341186', '100004411161186', '100004031701189', '100004276821186', '100004427591185', '100004108281186', '100004429301185', '100004374351186', '100004326751185', '100004150081185', '100004134231186', '100004146891185', '100004132181185', '100004132611185', '4103', '100004127791189', '100004112391187', '100003941273687', '100004091281185', '100003945196933', '100004059181185', '100003941496344', '100004084441185', '100004094671187', '2901', '100004094511189', '100003962361285', '100004021201185', '100004042451193', '100004045911191'
] + [
  # Too expensive
  '100004564341185', # 911
] + [
  # Too far
  '100003954075479', # Golf R
  '100004090201185', # M Roadster
] + [
  # Limited mileage
  '100004047501186', # 640ic
  '100004028681188', # C250
  '968',             # Cooper S Coupe
] + [
  # No response
  '100004239301185', '100004136251186', '100004199511185', '100004221691185', '100004135761186', '100004095661187', '100004064921187', '100004062531189', '100003954090380', '100004079111185', '100004042281187', '100004032221185', '100003977437187', '100004039311186'
]
blacklisted_models = []
blacklisted_models += [
  # Not so slow cars
  '1 Series',
  '3 Series',
  '4 Series',
  '5 Series',
  '7 Series',
  '500',
  'A3',
  'A4',
  'A6',
  'C-Class',
  'Camaro',
  'Cayman',
  'Challenger',
  'CLK-Class',
  'Cooper Clubman',
  'Cooper Countryman',
  'Cooper',
  'E-Class',
  'Eclipse Spyder',
  'Eos',
  'G Coupe',
  'G Sedan',
  'G35',
  'G37 Coupe',
  'G37 Sedan',
  'G37',
  'Golf',
  'GS 450h',
  'GTI',
  'Impreza',
  'IS 250 C',
  'IS 350',
  'M3',
  'MAZDA3',
  'Model S',
  'Mustang',
  'Q60 Coupe',
  'SLK-Class',
  'Veloster',
  'Z4',
] if defined?(FOR_JASON_ONLY) && FOR_JASON_ONLY
blacklisted_models += [
  # Slow cars
  'Avalon',
  'MDX',
  'Sequoia',
  'RX 300',
  'RX 330',
  'F-250 Super Duty',
  'Liberty',
  'Ranger',
  'NV200',
  'Ram Pickup 1500',
  'CV Tradesman',
  'Spark',
  'Terraza',
  'Pilot',
  'Rogue Select',
  'F-150',
  'EX35',
  'CX-9',
  'MPV',
  'GLA-Class',
  'MKS',
  'Aviator',
  'GS 300',
  '300',
  'Cooper Paceman',
  '1500',
  '4Runner',
  '500e',
  '500L',
  'Accord',
  'Altima Hybrid',
  'Altima',
  'Avalon Hybrid',
  'C-Max Energi',
  'C30',
  'C70',
  'Caliber',
  'Camry Hybrid',
  'Camry',
  'CC',
  'Charger',
  'Cherokee',
  'Civic',
  'Compass',
  'Corolla',
  'CR-V',
  'CR-Z',
  'Cruze',
  'CT 200h',
  'Cube',
  'CX-5',
  'E-Series Van',
  'Edge',
  'Elantra GT',
  'Elantra',
  'Element',
  'Encore',
  'Equinox',
  'Escalade EXT',
  'Escape Hybrid',
  'Escape',
  'Expedition',
  'Explorer Sport Trac',
  'Explorer',
  'Fit EV',
  'Fit',
  'FJ Cruiser',
  'Forester',
  'Forte',
  'fortwo',
  'Frontier',
  'Fusion',
  'G6',
  'GL-Class',
  'GLK-Class',
  'Grand Cherokee',
  'Highlander Hybrid',
  'Highlander',
  'ILX',
  'Insight',
  'iQ',
  'IS 250',
  'Jetta SportWagen',
  'Jetta',
  'Journey',
  'Juke',
  'Leaf',
  'Legacy',
  'LR3',
  'M-Class',
  'M35',
  'Malibu',
  'Matrix',
  'MAZDA6',
  'MKT',
  'Murano',
  'Navigator',
  'New Beetle',
  'Odyssey',
  'Optima',
  'Outback',
  'Passat',
  'Patriot',
  'Prius c',
  'Prius Plug-in',
  'Prius v',
  'Prius',
  'Q5',
  'Q50',
  'Quest',
  'QX56',
  'R-Class',
  'RAV4',
  'RDX',
  'Ridgeline',
  'Rogue',
  'RX 350',
  'S40',
  'S60',
  'Santa Fe',
  'Sebring',
  'Sentra',
  'Sienna',
  'Silverado 2500HD',
  'Sonata Hybrid',
  'Sonata',
  'Sorento',
  'Spectra',
  'Sportage',
  'Sprinter',
  'Tacoma',
  'Tahoe',
  'tC',
  'Terrain',
  'Tiguan',
  'TL',
  'Touareg',
  'Town and Country',
  'Transit Connect',
  'Tribeca',
  'TSX',
  'Tucson',
  'Versa',
  'Volt',
  'VUE',
  'Wrangler',
  'X1',
  'X3',
  'X5',
  'XC60',
  'XC90',
  'Xterra',
  'XV Crosstrek',
]

require 'time'
require 'net/http'
require 'json'

# Validate
if defined?(START_TIME) && defined?(END_TIME)
  DAY_IN_SECONDS = 60 * 60 * 24
  DAYS_ALLOWED_BY_SEARCH = 50
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
url += '&transmission=manual' if defined?(MANUALS_ONLY) && MANUALS_ONLY
url += '&body_style=convertible' if defined?(CONVERTIBLES_ONLY) && CONVERTIBLES_ONLY
uri = URI(url)
response = Net::HTTP.get(uri)
response = Net::HTTP.get(uri) while response =~ /Internal Server Error/
json = JSON.parse(response)
cars = json['cars']

# Filter
cars = cars.reject { |car| blacklisted_ids.include?(car['car_id']) }
cars = cars.reject { |car| blacklisted_models.include?(car['model']) }
cars = cars.select { |car| car['price_daily'].to_i >= MIN_PRICE }
cars = cars.select { |car| car['year'].to_i >= Time.now.year - MAX_AGE }

# Sort
cars = cars.sort_by { |car| [car['price_daily'].to_i, car['year'].to_i] }

# Print
puts "-- #{cars.count} cars out of #{json['cars'].count} --"
cars.each do |car|
  price = "$#{car['price_daily'][0..-4].ljust(6)}"
  year = "'#{car['year'][2..-1]}"
  make_model = "#{car['make']} #{car['model']}".ljust(30)
  url = "http://www.getaround.com/#{car['car_name'].ljust(25)}"
  car_id = car['car_id'].ljust(20)
  has_carkit = 'carkit' if car['carkit_enabled']
  is_instant = 'instant' if car['instant_rental']


  puts "#{price} #{year} #{make_model} #{url} #{car_id} #{has_carkit} #{is_instant}"
end
