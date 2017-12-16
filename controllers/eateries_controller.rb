require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative('./models/eatery.rb')

#index route to dislay all eateries
get('/eateries') do
  @eateries = Eatery.all()
  erb :index
end

#show diplays one eatery in view based on id in URL
get('/eateries/:id') do
  id = params[:id]
  @eatery = Eatery.find(id)
  erb :show
end
