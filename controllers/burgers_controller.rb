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

#new action
get('/burgers/new') do
  @eatery_id = params[:eatery_id]
  erb (:"burgers/new")
end

#show action diplays one burger in view based on id in URL
get('/burgers/:id') do
  id = params[:id]
  @burger = Burger.find(id)
  erb (:"burgers/show")
end

#delete action deletes one burger based on ID in URL
post('/burgers/:id/delete') do
  id = params[:id]
  @burger = Burger.find(id)
  @burger.delete()
  redirect'/burgers'
end

#create action
post('/burgers')do
  @burger = Burger.new(params)
  @burger.save()
  redirect'/burgers'
end

#edit action
get('/burgers/:id/edit') do
  id = params[:id]
  @burger = Burger.find(id)
  erb (:"burgers/edit")
end

#update
post('/burgers/:id') do
  id = params[:id]
  burger = Burger.find(id)
  params[:eatery_id] = burger.eatery_id
  @updated_burger = Burger.new(params)
  @updated_burger.update()
  redirect '/burgers'
end
