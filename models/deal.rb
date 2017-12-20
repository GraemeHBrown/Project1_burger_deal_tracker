require_relative('../db/sql_runner.rb')
require_relative('./burger.rb')
require_relative('./eatery.rb')

class Deal

  attr_reader :id
  attr_accessor :deal_name, :day, :eatery_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @deal_name = options['deal_name']
    @day = options['day']
    @eatery_id = options['eatery_id']
  end

  def save()
    sql = "INSERT INTO deals
    (
      deal_name,
      day,
      eatery_id
    )
    VALUES
    (
      $1, $2, $3
    )
    RETURNING id"
    values = [@deal_name, @day, @eatery_id]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def update()
    sql = "UPDATE deals
    SET
    (
      deal_name,
      day,
      eatery_id
      ) =
      (
        $1, $2, $3
      )
      WHERE id = $4"
      values = [@deal_name, @day, @eatery_id, @id]
      SqlRunner.run(sql, values)
    end

    def delete()
      sql = "DELETE FROM deals
      WHERE id = $1"
      values = [@id]
      SqlRunner.run(sql, values)
    end

    def burgers()
      sql = "SELECT burgers.* FROM burgers
      INNER JOIN burgers_deals ON burgers_deals.burger_id = burgers.id
      WHERE burgers_deals.deal_id = $1;"
      values = [@id]
      results = SqlRunner.run(sql, values)
      return results.map{|burger| Burger.new(burger)}
    end

    def eatery()
      sql = "SELECT * FROM eateries WHERE id = $1;"
      values = [@eatery_id]
      results = SqlRunner.run(sql, values)
      return Eatery.new(results.first)
    end

    def find_burgers_to_add()
      sql = "SELECT * FROM burgers WHERE id NOT IN (
      SELECT burger_id FROM burgers_deals
      WHERE deal_id = $1
      ) AND eatery_id = $2"
      values = [@id, @eatery_id]
      results = SqlRunner.run(sql, values)
      return results.map{|burger| Burger.new(burger)}
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

    def self.all_deals_by_day()
      sql = "SELECT * FROM deals
      ORDER BY
      CASE
      WHEN Day = 'Sunday' THEN 1
      WHEN Day = 'Monday' THEN 2
      WHEN Day = 'Tuesday' THEN 3
      WHEN Day = 'Wednesday' THEN 4
      WHEN Day = 'Thursday' THEN 5
      WHEN Day = 'Friday' THEN 6
      WHEN Day = 'Saturday' THEN 7
      END ASC;"
      values = []
      results = SqlRunner.run(sql, values)
      return results.map { |deal| Deal.new(deal) }
    end

    def self.find_deals_for_day(day)
      sql = "SELECT * FROM deals WHERE day = $1"
      values = [day]
      results = SqlRunner.run(sql, values)
      binding.pry
      return results.map { |deal| Deal.new(deal) }
    end

  end
