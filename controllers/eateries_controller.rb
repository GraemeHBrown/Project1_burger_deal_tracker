require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative('../models/eatery.rb')

#index route to dislay all eateries
get('/eateries') do
  @eateries = Eatery.all()
  erb :index
end

#show action diplays one eatery in view based on id in URL
get('/eateries/:id') do
  id = params[:id]
  @eatery = Eatery.find(id)
  erb :show
end

#delete action deletes one eatery based on ID in URL
post('/eateries/:id/delete') do
  id = params[:id]
  @eatery = Eatery.find(id)
  @eatery.delete()
  redirect'/eateries'
end

#new action
get('/eateries/new') do
  erb :new
end
