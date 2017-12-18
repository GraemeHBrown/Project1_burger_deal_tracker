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



end
