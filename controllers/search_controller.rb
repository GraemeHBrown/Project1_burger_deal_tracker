enable :sessions

get '/search' do
  erb(:"search/deal_search")
end
