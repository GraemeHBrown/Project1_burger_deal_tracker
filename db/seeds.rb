require('pry-byebug')
require_relative('../models/eatery.rb')
require_relative('../models/burger.rb')
require_relative('../models/deal.rb')
require_relative('../models/burger_deal.rb')

###Delete
Burger.delete_all()
Eatery.delete_all()
Deal.delete_all()
BurgerDeal.delete_all()

###Eateries
bobs_burgers = Eatery.new({'name' => 'Bobs Burgers', 'location' => 'Edinburgh'})
bobs_burgers.save()

burgers_r_us = Eatery.new({'name' => 'Burgers R Us', 'location' => 'Edinburgh'})
burgers_r_us.save()

burger_meats_burger = Eatery.new({'name' => 'Burger Meats Burger', 'location' => 'Edinburgh'})
burger_meats_burger.save()

mcdonalds = Eatery.new({'name' => 'McDs', 'location' => 'Edinburgh'})
mcdonalds.save()

###Burgers data

whopper = Burger.new({'name' => 'Whopper', 'price' => 3.50, 'eatery_id' => burger_meats_burger.id })
whopper.save()

big_mac = Burger.new({'name' => 'Big Mac', 'price' => 2.50, 'eatery_id' => mcdonalds.id })
big_mac.save()

royale = Burger.new({'name' => 'Royale', 'price' => 17.50, 'eatery_id' => burger_meats_burger.id })
royale.save()

blt_burger = Burger.new({'name' => 'BLT Burger', 'price' => 5.50, 'eatery_id' => burger_meats_burger.id })
blt_burger.save()

###Deals data

two_for_one_tuesday = Deal.new({'deal_name' => 'Two for one', 'day' => 'Tuesday', 'eatery_id' => burger_meats_burger.id })
two_for_one_tuesday.save()

two_for_one_thursday = Deal.new({'deal_name' => 'Two for one', 'day' => 'Thursday', 'eatery_id' => burger_meats_burger.id })
two_for_one_thursday.save()

twenty_five_percent_off = Deal.new({'deal_name' => '25% off', 'day' => 'Friday', 'eatery_id' => bobs_burgers.id })
twenty_five_percent_off.save()

### Burgers_deals
two_for_one_royale_tuesday = BurgerDeal.new({'deal_id' => two_for_one_tuesday.id, 'burger_id' => royale.id})
two_for_one_royale_tuesday.save()

two_for_one_blt_tuesday = BurgerDeal.new({'deal_id' => two_for_one_tuesday.id, 'burger_id' => blt_burger.id})
two_for_one_blt_tuesday.save()

two_for_one_whopper_thursday = BurgerDeal.new({'deal_id' => two_for_one_thursday.id, 'burger_id' => whopper.id})
two_for_one_whopper_thursday.save() 
