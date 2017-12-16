require('pry-byebug')
require_relative('../models/eatery.rb')

###Eatery data
Eatery.delete_all()

bobs_burgers = Eatery.new({'name' => 'Bobs Burgers', 'location' => 'Edinburgh'})
bobs_burgers.save()

burgers_r_us = Eatery.new({'name' => 'Burgers R Us', 'location' => 'Edinburgh'})
burgers_r_us.save()

###Burgers data
