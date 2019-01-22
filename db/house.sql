DROP TABLE IF EXISTS houses;

CREATE TABLE houses (
  id SERIAL8,
  address VARCHAR(255),
  value FLOAT(2),
  rooms INT2,
  year INT2,
  buy_let VARCHAR(50),
  square_footage INT2,
  build_type VARCHAR(50));

  -- @address = options['address']
  -- @value = options['value'].to_f
  -- @rooms = options['rooms'].to_i
  -- @year = options['year'].to_i
  -- @buy_let = options['buy_let']
  -- @square_footage = options['square_footage'].to_i
  -- @build_type = options['build_type']
  -- @id = options['id'] if options['id']
