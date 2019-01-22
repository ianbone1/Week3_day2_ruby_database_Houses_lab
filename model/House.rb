require("pg")

class House

  attr_accessor :address, :value, :rooms, :year, :buy_let, :square_footage, :build_type, :id
  attr_reader :id

  def initialize(options)
    @address = options['address']
    @value = options['value'].to_f
    @rooms = options['rooms'].to_i
    @year = options['year'].to_i
    @buy_let = options['buy_let']
    @square_footage = options['square_footage'].to_i
    @build_type = options['build_type']
    @id = options['id'] if options['id']
  end

  def House.delete_all()
    db = PG.connect({dbname: 'house', host: 'localhost'})
    sql = "TRUNCATE TABLE houses;"
    db.prepare("delete_all", sql)
    db.exec_prepared("delete_all")
    db.close
  end

  def House.find_by_id(find_id)
    db = PG.connect({dbname: 'house', host: 'localhost'})
    sql = "SELECT * FROM houses WHERE id = $1;"
    values = [find_id]
    db.prepare("find", sql)
    found_house_hash = db.exec_prepared("find", values)
    found_house = found_house_hash.map{|house| House.new(house)}
    return found_house
  end

  def House.find_by_address(find_address)
    find_address = '%' + find_address + '%'
    db = PG.connect({dbname: 'house', host: 'localhost'})
    sql = "SELECT * FROM houses WHERE address ILIKE $1;"
    values = [find_address]
    db.prepare("find_address", sql)
    found_houses_hash = db.exec_prepared("find_address", values)
    found_houses = found_houses_hash.map {|house| House.new(house)}
    return found_houses
  end

  def save()
    db = PG.connect({dbname: 'house', host: 'localhost'})
    sql = "INSERT INTO houses (
      address, value, rooms, year, buy_let,
      square_footage, build_type) VALUES (
      $1, $2, $3, $4, $5, $6, $7
      ) RETURNING id;"
    values = [@address, @value, @rooms, @year,
      @buy_let, @square_footage, @build_type]
    db.prepare("save", sql)
    @id = db.exec_prepared("save", values)[0]['id']
    db.close()
  end

  def delete()
    db = PG.connect({dbname: 'house', host: 'localhost'})
    sql = "DELETE FROM houses where id = $1;"
    values = [@id]
    db.prepare("delete_me", sql)
    db.exec_prepared("delete_me", values)
    db.close
  end

  def update()
    db = PG.connect({dbname: 'house', host: 'localhost'})
    sql = "UPDATE houses SET (
      address, value, rooms, year, buy_let,
      square_footage, build_type) = (
      $1, $2, $3, $4, $5, $6, $7)
      WHERE id = $8;"
    values = [@address, @value, @rooms, @year,
      @buy_let, @square_footage, @build_type, @id]
    db.prepare("update", sql)
    db.exec_prepared("update", values)
    db.close
  end
end
