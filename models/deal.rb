require_relative('../db/sql_runner.rb')

class Deal

attr_reader :id
attr_accessor :deal_name, :day, :burger_id

def initialize(options)
  @id = options['id'].to_i if options['id']
  @deal_name = options['deal_name']
  @day = options['day']
  @burger_id = options['burger_id']
end

def save()
  sql = "INSERT INTO deals
  (
    deal_name,
    day,
    burger_id
  )
  VALUES
  (
    $1, $2, $3
  )
  RETURNING id"
  values = [@deal_name, @day, @burger_id]
  results = SqlRunner.run(sql, values)
  @id = results.first()['id'].to_i
end

def update()
  sql = "UPDATE deals
  SET
  (
    deal_name,
    day,
    burger_id
    ) =
    (
      $1, $2, $3
    )
    WHERE id = $4"
    values = [@deal_name, @day, @burger_id, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM deals
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

def self.delete_all()
  sql = "DELETE FROM deals;"
  values = []
  SqlRunner.run(sql, values)
end

def self.find(id)
  sql = "SELECT * FROM deals
  WHERE id = $1"
  values = [id]
  results = SqlRunner.run(sql, values)
  return Deal.new(results.first)
end

def self.all()
  sql = "SELECT * FROM deals;"
  values = []
  results = SqlRunner.run(sql, values)
  return results.map { |deal| Deal.new(deal) }
end

end
