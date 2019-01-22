require('./model/House.rb')
require('pry')

house1 = House.new(
  'address' => 'Amitivil, Top Of The Hill, Party Town',
  'value' => 400_000,
  'rooms' => 19,
  'year' => 1986,
  'buy_let' => 'Buy',
  'square_footage' => 30_000,
  'build_type' => 'Detached'
)


house2 = House.new(
  'address' => 'Soggy Bottom, Bakerton, Cakeville',
  'value' => 100_000,
  'rooms' => 3,
  'year' => 1969,
  'buy_let' => 'Let',
  'square_footage' => 2_000,
  'build_type' => 'Semi'
)

house3 = House.new(
  'address' => 'The Dataplex, Codeville, Hackerton',
  'value' => 120_000,
  'rooms' => 1,
  'year' => 1972,
  'buy_let' => 'Let',
  'square_footage' => 900,
  'build_type' => 'Flat'
)


#
# @address = options['address']
# @value = options['value'].to_f
# @rooms = options['rooms'].to_i
# @year = options['year'].to_i
# @buy_let = options['buy_let']
# @square_footage = options['square_footage'].to_i
# @build_type = options['build_type']
# @id = options['id'] if options['id']



# House.delete_all()

house1.save()
house2.save()
house3.save()

house2.build_type = "Flat"
house2.update()

#house3.delete()

found_house1 = House.find_by_id(58)

found_house2 = House.find_by_address("soggy")

binding.pry

nil
