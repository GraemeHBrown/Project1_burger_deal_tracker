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
  @message = session.delete(:message)
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
  @name = params['name']
  if @name.nil? || @name.empty?
      session[:message] = "You need to enter an eatery name to create a new eatery."
      redirect'/eateries/new'
  else
    @eatery = Eatery.new(params)
    @eatery.save()
    session[:message] = "Successfully created the eatery named: #{@eatery.name}."
    redirect'/eateries'
  end
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
  session[:message] = "Successfully updated the eatery named: #{@eatery.name}."
  redirect '/eateries'
end
