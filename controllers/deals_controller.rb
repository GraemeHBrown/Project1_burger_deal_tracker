require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative('../models/burger.rb')
require_relative('../models/eatery.rb')

#index route to dislay all deals for an eatery
get('/deals') do
  @eateries = Eatery.all()
  @deals = []
  if params[:eatery_id]
    id = params[:eatery_id]
    @eatery = Eatery.find(id)
    @deals = @eatery.deals()
  end
  erb (:"deals/index")
end
