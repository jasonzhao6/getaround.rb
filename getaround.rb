# DEBUG = true
# MANUALS_ONLY = true
# CONVERTIBLES_ONLY = true
FOR_JASON_ONLY = true
# START_TIME = Time.local(2015,8,14,20,30)
# END_TIME = Time.local(2015,8,15,20,30)
MAX_AGE = 10
MIN_PRICE = 64
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
  '100004492541185', # '15 M4 $251
  '100004053391186', # '10 370Z $138
] if defined?(FOR_JASON_ONLY) && FOR_JASON_ONLY
blacklisted_ids += [
  # Slow cars
  '100004609771188', '100004594961185', '100004777871186', '100004546161185', '100004842861186',
  '100004788341189', '100004578951186', '100004718411185', '100004658401185', '100004630941185',
  '100004863751185', '100004822811185', '100004805891190', '100004052731187', '100004645451185',
  '100004454341186', '100004411161186', '100004031701189', '100004276821186', '100004427591185',
  '100004108281186', '100004429301185', '100004374351186', '100004326751185', '100004150081185',
  '100004134231186', '100004146891185', '100004132181185', '100004132611185', '100004127791189',
  '100004112391187', '100003941273687', '100004091281185', '100003945196933', '100004059181185',
  '100003941496344', '100004084441185', '100004094671187', '100004094511189', '100003962361285',
  '100004021201185', '100004042451193', '100004045911191', '100004718701186', '100004566931186',
  '100004379271187', '100004897721185', '100004353061185', '100004642661186', '100004797711189',
] + [
  # Too expensive
  '100004564341185', # 911
]
blacklisted_models = []
blacklisted_models += [
  # Not so slow cars
  '1 Series',
  '3 Series',
  '350Z',
  '370Z',
  '4 Series',
  '5 Series',
  '500',
  '7 Series',
  'A3',
  'A4',
  'A6',
  'ActiveHybrid 5',
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
  'Golf GTI',
  'GS 450h',
  'GTI',
  'Impreza',
  'IS 250 C',
  'IS 300',
  'IS 350',
  'M3',
  'M4',
  'Model S',
  'Mustang',
  'Q60 Coupe',
  'SLK-Class',
  'Veloster',
  'Z4',
] if defined?(FOR_JASON_ONLY) && FOR_JASON_ONLY
blacklisted_models += [
  # Slow cars
  '1500',
  '300',
  '4Runner',
  '500e',
  '500L',
  'Accent',
  'Accord Cpe EX V6',
  'Accord',
  'allroad quattro',
  'Altima Hybrid',
  'Altima',
  'Avalanche',
  'Avalon Hybrid',
  'Avalon',
  'Aviator',
  'Beetle',
  'C-Max Energi',
  'C-Max Hybrid',
  'C30',
  'C70',
  'Caliber',
  'Camry Hybrid',
  'Camry Solara',
  'Camry',
  'CC',
  'Charger',
  'Cherokee',
  'Civic',
  'Cobalt',
  'Compass',
  'Cooper Paceman',
  'Corolla',
  'CR-V',
  'CR-Z',
  'Cruze',
  'CT 200h',
  'Cube',
  'CV Tradesman',
  'CX-5',
  'CX-9',
  'Dart',
  'E-Series Van',
  'Eclipse Spyder',
  'Eclipse',
  'Econoline Cargo',
  'Edge',
  'Elantra GT',
  'Elantra',
  'Element',
  'Encore',
  'Envoy',
  'Equinox',
  'ES 300h',
  'Escalade ESV',
  'Escalade EXT',
  'Escape Hybrid',
  'Escape',
  'EX35',
  'Expedition',
  'Explorer Sport Trac',
  'Explorer',
  'F-150',
  'F-250 Super Duty',
  'Fit EV',
  'Fit',
  'FJ Cruiser',
  'Forester',
  'Forte',
  'fortwo',
  'Frontier',
  'Fusion Hybrid',
  'Fusion',
  'FX35',
  'G6',
  'GL-Class',
  'GLA-Class',
  'GLK-Class',
  'Golf SportWagen',
  'Golf',
  'Grand Caravan',
  'Grand Cherokee',
  'GS 300',
  'GX 460',
  'Highlander Hybrid',
  'Highlander',
  'ILX',
  'Impala',
  'Insight',
  'iQ',
  'IS 250',
  'Jetta SportWagen',
  'Jetta',
  'Journey',
  'Juke',
  'Leaf',
  'Legacy',
  'Liberty',
  'LR3',
  'M-Class',
  'M35',
  'Malibu',
  'Matrix',
  'Maxima',
  'MAZDA3',
  'Mazda3',
  'MAZDA5',
  'Mazda5',
  'MAZDA6',
  'Mazda6',
  'MDX',
  'Mirage',
  'MKS',
  'MKT',
  'Mountaineer',
  'MPV',
  'Murano',
  'Navigator',
  'New Beetle',
  'NV200',
  'Odyssey',
  'Optima',
  'Outback',
  'Outlook',
  'Passat',
  'Patriot',
  'Pilot',
  'Prius c',
  'Prius Plug-in',
  'Prius v',
  'Prius',
  'Q5',
  'Q50',
  'Quest',
  'QX56',
  'R-Class',
  'Rabbit',
  'Ram Pickup 1500',
  'Ram Pickup 2500',
  'Ranger',
  'RAV4',
  'RDX',
  'Ridgeline',
  'Rogue Select',
  'Rogue',
  'Rover Range Rover Sport',
  'RX 300',
  'RX 330',
  'RX 350',
  'RX 400h',
  'S40',
  'S60',
  'Santa Fe',
  'Sebring',
  'Sedona',
  'Sentra',
  'Sequoia',
  'Sienna',
  'Silverado 2500HD',
  'Sonata Hybrid',
  'Sonata',
  'Sorento',
  'Soul',
  'Spark',
  'Spectra',
  'Sportage',
  'Sprinter',
  'Suburban',
  'Tacoma',
  'Tahoe',
  'tC',
  'Terrain',
  'Terraza',
  'Tiguan',
  'TL',
  'Touareg 2',
  'Touareg',
  'Town and Country',
  'Transit Connect',
  'Traverse',
  'Tribeca',
  'TSX',
  'Tucson',
  'Versa Note',
  'Versa',
  'Volt',
  'VUE',
  'Wrangler',
  'X1',
  'X3',
  'X5',
  'xA',
  'xB',
  'XC60',
  'XC90',
  'xD',
  'Xterra',
  'XV Crosstrek',
  'Yaris',
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
  url = "getaround.com/#{car['car_name'].ljust(25)}"
  car_id = car['car_id'].ljust(20)

  puts "#{price} #{year} #{make_model} #{url} #{car_id}"
end
