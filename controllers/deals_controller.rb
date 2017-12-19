require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative('../models/burger.rb')
require_relative('../models/eatery.rb')
require_relative('../models/burger_deal.rb')

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

#new action
get('/deals/new') do
  @eatery_id = params[:eatery_id]
  erb (:"deals/new")
end

#show action diplays one deal in view based on id in URL
get('/deals/:id') do
  id = params[:id]
  @deal = Deal.find(id)
  erb (:"deals/show")
end

#edit action
get('/deals/:id/edit') do
  id = params[:id]
  @deal = Deal.find(id)
  erb (:"deals/edit")
end

#create action
post('/deals')do
@deal = Deal.new(params)
@deal.save()
redirect'/deals'
end

post('/deals/add_burger') do
  @burger_deal = BurgerDeal.new(params)
  @burger_deal.save()
  redirect '/deals'
end

#update action
post('/deals/:id') do
  id = params[:id]
  deal = Deal.find(id)
  params[:eatery_id] = deal.eatery_id
  @updated_deal = Deal.new(params)
  @updated_deal.update()
  redirect '/deals'
end

#delete action deletes one deal based on ID in URL
post('/deals/:id/delete') do
  id = params[:id]
  @deal = Deal.find(id)
  @deal.delete()
  redirect'/deals'
end

#add burger to deal
get('/deals/:id/add_burger') do
  id = params[:id]
  @deal = Deal.find(id)
  @eatery = @deal.eatery()
  @all_eatery_burgers = @eatery.burgers()
  erb (:"deals/add_burger")
end

post('/deals/add_burger') do
  @burger_deal = BurgerDeal.new(params)
  @burger_deal.save()
  redirect '/deals'
end
