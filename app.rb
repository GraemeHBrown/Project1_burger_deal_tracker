require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/eateries_controller')


get '/' do
  erb( :index )
end
