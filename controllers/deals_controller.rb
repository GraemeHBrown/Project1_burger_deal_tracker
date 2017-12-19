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
