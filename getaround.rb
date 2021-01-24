# DEBUG = true
# MANUALS_ONLY = true
# CONVERTIBLES_ONLY = true
# FOR_JASON_ONLY = true
START_TIME = Time.local(2018,10,13,18,00)
END_TIME = Time.local(2018,10,14,18,00)
MAX_AGE = 20
MIN_PRICE = 64
blacklisted_ids = []
blacklisted_ids += [
  # Ranked list
  # 'Not GetAround', # '18 M3 Friend
  # 'Not GetAround', # '07 F430 Spider $996 / 2
  '100004263631187', # '14 C7 Z51 $266
  '100003967135212', # '08 S2000 $91 + $137
  # 'Not GetAround', # '16 911 GT3 $996 / 2
  # 'Not GetAround', # '18 911 GTS Friend
  '100004392791188', # '09 Cayman $136
  '100004298771185', # '10 R8 V8 $781
  '100004027131187', # '14 911 Cabriolet $301
  '100006771391185', # '15 RC F $99 * 2
  '100004492541185', # '15 M4 Convertible $251
  '100004317911185', # '11 M3 $160
  '100004027211186', # '14 Z435is $251
  # 'Not GetAround', # '11 135i
  # 'Not GetAround', # '18 124 Abarth
  '100005063411185', # '16 MX-5 $176
  '100004140221190', # '13 STI $201
  '100006895741187', # '16 S6 $155
  '100006568961185', # '14 F Type $256
  '100004449271186', # '15 FRS RS 1.0 $66
  '100004608641187', # '15 GTI MK7 $97
  '100004053391186', # '10 370Z $138
  '100007102271186', # '15 Mustang GT $114
  '100004030001192', # '10 Cooper S $177
  '100004025651186', # '13 GTI MK6 $62
  '100004081211185', # '13 500 Abarth $113 * 2
  '100004316571185', # '12 SLK 350 $156
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
  '100005328451186', '100005048341187', '100006917031188', '100004457491186', '100006490051185'
] + [
  # Too expensive
  '100004564341185', # 911
]
blacklisted_models = []
blacklisted_models += [
  # Not so slow cars
  '1 Series',
  '3 Series Gran Turismo',
  '3 Series',
  '350Z',
  '370Z',
  '4 Series Gran Coupe',
  '4 Series',
  '5 Series',
  '7 Series',
  'Boxster',
  'Camaro',
  'Cayman',
  'Challenger',
  'CLA-Class',
  'CLK-Class',
  'E-Class',
  'FR-S',
  'Genesis Coupe',
  'Genesis',
  'Golf GTI',
  'GTI',
  'Impreza',
  'M3',
  'M4',
  'Model S',
  'Mustang',
  'MX-5 Miata',
  'Panamera',
  'Q60 Coupe',
  'S3',
  'S4',
  'S5',
  'S6',
  'SLK-Class',
  'Z4',
] if defined?(FOR_JASON_ONLY) && FOR_JASON_ONLY
blacklisted_models += [
  # Slow cars
  '1500',
  '2',
  '200',
  '3',
  '300',
  '4Runner',
  '5',
  '500',
  '500',
  '500e',
  '500L',
  '6',
  'A3 Sportback e-tron',
  'A3',
  'A4',
  'A5',
  'A6',
  'Accent',
  'Accord Cpe EX V6',
  'Accord Hybrid',
  'Accord',
  'ActiveHybrid 5',
  'allroad quattro',
  'Altima Hybrid',
  'Altima',
  'ATS',
  'Avalanche',
  'Avalon Hybrid',
  'Avalon',
  'Aveo',
  'Aviator',
  'Beetle',
  'C-Class',
  'C-Max Energi',
  'C-Max Hybrid',
  'C30',
  'C70',
  'Caliber',
  'Camry Hybrid',
  'Camry Solara',
  'Camry',
  'Cayenne',
  'CC',
  'Charger',
  'Cherokee',
  'Civic',
  'Cobalt',
  'Colorado',
  'Compass',
  'Cooper Clubman',
  'Cooper Countryman',
  'Cooper Coupe',
  'Cooper Paceman',
  'Cooper Roadster',
  'Cooper',
  'Corolla',
  'CR-V',
  'CR-Z',
  'Crosstrek',
  'Cruze Limited',
  'Cruze',
  'CT 200h',
  'Cube',
  'CV Tradesman',
  'CX-3',
  'CX-5',
  'CX-9',
  'Dakota',
  'Dart',
  'E-Series Van',
  'Eclipse Spyder',
  'Eclipse Spyder',
  'Eclipse',
  'Econoline Cargo',
  'Edge',
  'Elantra GT',
  'Elantra',
  'Element',
  'ELR',
  'Encore',
  'Envoy',
  'Eos',
  'Equinox',
  'ES 300h',
  'ES 330',
  'ES 350',
  'Escalade ESV',
  'Escalade EXT',
  'Escape Hybrid',
  'Escape',
  'EX35',
  'Expedition',
  'Explorer Sport Trac',
  'Explorer',
  'F-150 Heritage',
  'F-150',
  'F-250 Super Duty',
  'F-350 Super Duty',
  'Fiesta',
  'Fit EV',
  'Fit',
  'FJ Cruiser',
  'Flex',
  'Focus',
  'Forester',
  'Forte',
  'fortwo',
  'Frontier',
  'Fusion Energi',
  'Fusion Hybrid',
  'Fusion',
  'FX35',
  'FX45',
  'G Coupe',
  'G Sedan',
  'G35',
  'G37 Coupe',
  'G37 Sedan',
  'G37',
  'G6',
  'GL-Class',
  'GLA-Class',
  'GLC-Class',
  'GLK-Class',
  'Golf SportWagen',
  'Golf',
  'Grand Caravan',
  'Grand Cherokee',
  'GS 300',
  'GS 450h',
  'GX 460',
  'HHR',
  'Highlander Hybrid',
  'Highlander',
  'HR-V',
  'iA',
  'ILX',
  'iM',
  'Impala Limited',
  'Impala',
  'Insight',
  'iQ',
  'IS 200t',
  'IS 250 C',
  'IS 250',
  'IS 300',
  'IS 350',
  'Jetta Hybrid',
  'Jetta SportWagen',
  'Jetta',
  'Journey',
  'Juke',
  'Lancer',
  'Leaf',
  'Legacy',
  'Liberty',
  'LR3',
  'M-Class',
  'M35',
  'Macan',
  'Malibu Limited',
  'Malibu',
  'Mariner Hybrid',
  'Matrix',
  'Maxima',
  'MAZDA3',
  'Mazda3',
  'MAZDA5',
  'Mazda5',
  'MAZDA6',
  'Mazda6',
  'Mazdaspeed 3',
  'MDX',
  'Mirage',
  'MKS',
  'MKT',
  'Model X',
  'Mountaineer',
  'MPV',
  'Murano',
  'Navigator',
  'New Beetle',
  'NV Passenger',
  'NV200',
  'NX 200t',
  'NX 300h',
  'NX 300t',
  'Odyssey',
  'Optima',
  'Outback',
  'Outlander',
  'Outlook',
  'Passat',
  'Pathfinder',
  'Patriot',
  'Pilot',
  'Prius c',
  'Prius Plug-in',
  'Prius v',
  'Prius',
  'Q3',
  'Q5',
  'Q50',
  'Q7',
  'Quest',
  'QX30',
  'QX50',
  'QX56',
  'R-Class',
  'Rabbit',
  'Ram Pickup 1500',
  'Ram Pickup 2500',
  'Range Rover Evoque',
  'Range Rover Sport',
  'Range Rover',
  'Ranger',
  'RAV4 Hybrid',
  'RAV4',
  'RC 200t',
  'RDX',
  'Renegade',
  'Ridgeline',
  'RLX',
  'Rogue Select',
  'Rogue',
  'Rover Range Rover Sport',
  'RX 300',
  'RX 330',
  'RX 350',
  'RX 400h',
  'RX 450h',
  'S-Series',
  'S40',
  'S60',
  'Santa Fe',
  'Savana',
  'Sebring',
  'Sedona',
  'Sentra',
  'Sequoia',
  'Sienna',
  'Sierra 1500',
  'Silverado 1500',
  'Silverado 2500HD',
  'Sonata Hybrid',
  'Sonata',
  'Sonic',
  'Sorento',
  'Soul',
  'Spark',
  'Spectra',
  'Sportage',
  'Sprinter',
  'Suburban',
  'SX4',
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
  'Transit Wagon',
  'Traverse',
  'Tribeca',
  'TSX',
  'Tucson',
  'Tundra',
  'V50',
  'Veloster',
  'Verano',
  'Versa Note',
  'Versa',
  'Volt',
  'VUE',
  'Wrangler',
  'X1',
  'X3',
  'X4',
  'X5',
  'xA',
  'xB',
  'XC60',
  'XC90',
  'xD',
  'Xterra',
  'XTS',
  'XV Crosstrek',
  'Yaris iA',
  'Yaris',
  'Yukon XL',
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
cars = cars.select { |car| car['year'].to_i >= Time.now.year - MAX_AGE } if defined?(MAX_AGE)

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
