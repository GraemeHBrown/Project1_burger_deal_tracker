require('pry-byebug')
require_relative('./models/eatery.rb')

bobs_burgers = Eatery.new({'name' => 'Bobs Burgers', 'location' => 'Edinburgh'})
bobs_burgers.save()


burgers_r_us = Eatery.new({'name' => 'Burgers R Us', 'location' => 'Edinburgh'})
burgers_r_us.save()

all_eateries = Eatery.all()

found_eatery = Eatery.find(bobs_burgers.id)

bobs_burgers.delete()

found_eatery = Eatery.find(bobs_burgers.id)

binding.pry

nil
