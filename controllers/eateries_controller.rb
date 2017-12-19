require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative('../models/eatery.rb')

enable :sessions

#index route to dislay all eateries
get('/eateries') do
  @message = session.delete(:message)
  @eateries = Eatery.all()
  erb (:"eateries/index")
end

#new action
get('/eateries/new') do
  erb (:"eateries/new")
end

#show action diplays one eatery in view based on id in URL
get('/eateries/:id') do
  id = params[:id]
  @eatery = Eatery.find(id)
  erb (:"eateries/show")
end

#delete action deletes one eatery based on ID in URL
post('/eateries/:id/delete') do
  id = params[:id]
  @eatery = Eatery.find(id)
  @eatery.delete()
  session[:message] = "Successfully deleted the eatery named: #{@eatery.name}."
  redirect'/eateries'
end

#create action
post('/eateries')do
  @eatery = Eatery.new(params)
  @eatery.save()
  redirect'/eateries'
end

#edit action
get('/eateries/:id/edit') do
  id = params[:id]
  @eatery = Eatery.find(id)
  erb (:"eateries/edit")
end

#update
post('/eateries/:id') do
  id = params[:id]
  @eatery = Eatery.new(params)
  @eatery.update()
  redirect '/eateries'
end
