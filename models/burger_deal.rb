require_relative('../db/sql_runner.rb')

class BurgerDeal

attr_reader :id
attr_accessor :deal_id, :burger_id

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @deal_id = options['deal_id'].to_i
    @burger_id = options['burger_id'].to_i
  end

  def save()
    sql = "INSERT INTO burgers_deals
    (
      deal_id,
      burger_id
    )
    VALUES
    (
      $1, $2
    )
    RETURNING id"
    values = [@deal_id, @burger_id]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def update()
    sql = "UPDATE burgers_deals
    SET
    (
      deal_id,
      burger_id
      ) =
      (
        $1, $2
      )
      WHERE id = $3"
      values = [@deal_id, @burger_id, @id]
      SqlRunner.run(sql, values)
    end

    def delete()
      sql = "DELETE FROM burgers_deals
      WHERE id = $1"
      values = [@id]
      SqlRunner.run(sql, values)
    end

    def self.delete_all()
      sql = "DELETE FROM burgers_deals;"
      values = []
      SqlRunner.run(sql, values)
    end

    def self.find(id)
      sql = "SELECT * FROM burgers_deals
      WHERE id = $1"
      values = [id]
      results = SqlRunner.run(sql, values)
      return BurgerDeal.new(results.first)
    end

    def self.all()
      sql = "SELECT * FROM burgers_deals;"
      values = []
      results = SqlRunner.run(sql, values)
      return results.map { |burger_deal| BurgerDeal.new(burger_deal) }
    end

end
