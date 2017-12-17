require_relative('../db/sql_runner.rb')

class Burger

  attr_reader :id
  attr_accessor :name, :price, :eatery_id

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @price = options['price'].to_f
    @eatery_id = options['eatery_id'].to_i
  end

  def save()
    sql = "INSERT INTO burgers
    (
      name,
      price,
      eatery_id
    )
    VALUES
    (
      $1, $2, $3
    )
    RETURNING id"
    values = [@name, @price, @eatery_id]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def self.find(id)
    sql = "SELECT * FROM burgers
    WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    return Burger.new(results.first)
  end

end
