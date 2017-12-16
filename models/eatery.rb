require_relative('../db/sql_runner.rb')

class Eatery

attr_reader :id
attr_accessor :name, :location

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @location = options['location']
  end

  def save()
  sql = "INSERT INTO eateries
  (
    name,
    location
  )
  VALUES
  (
    $1, $2
  )
  RETURNING id"
  values = [@name, @location]
  results = SqlRunner.run(sql, values)
  @id = results.first()['id'].to_i
end

end
