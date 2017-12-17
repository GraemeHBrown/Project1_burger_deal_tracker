require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative('../models/burger.rb')
require_relative('../models/eatery.rb')

#index route to dislay all burgers
get('/burgers') do
  @eateries = Eatery.all()
  @burgers = []
  if params[:eatery_id]
    id = params[:eatery_id]
    @eatery = Eatery.find(id)
    @burgers = @eatery.burgers()
  end
  erb (:"burgers/index")
end
