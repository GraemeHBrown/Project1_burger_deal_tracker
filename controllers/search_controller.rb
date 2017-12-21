require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative('../models/burger.rb')
require_relative('../models/eatery.rb')
require_relative('../models/deal.rb')
require_relative('../models/burger_deal.rb')

enable :sessions

get '/search' do
  erb(:"search/deal_search")
end

get('/search/days') do
  @deals_by_day = Deal.all_deals_by_day()
  erb(:"search/days")
end

get('/search/day') do
  day = params[:day]
  @deals = Deal.find_deals_for_day(day)
  erb(:"search/day")
end

get('/type') do
  erb(:"search/type")
end

get('/location') do
  erb(:"search/location")
end
