require('pry-byebug')
require_relative('./models/eatery.rb')

bobs_burgers = Eatery.new({'name' => 'Bobs Burgers', 'location' => 'Edinburgh'})
bobs_burgers.save()

binding.pry

nil
