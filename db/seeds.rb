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

mcdonalds = Eatery.new({'name' => 'McDonalds', 'location' => 'Edinburgh'})
mcdonalds.save()

###Burgers data

whopper = Burger.new({'name' => 'Whopper', 'price' => 3.50, 'eatery_id' => burger_meats_burger.id })
whopper.save()

big_mack = Burger.new({'name' => 'Big Mack', 'price' => 2.50, 'eatery_id' => bobs_burgers.id })
big_mack.save()

royale = Burger.new({'name' => 'Royale', 'price' => 17.50, 'eatery_id' => burger_meats_burger.id })
royale.save()

blt_burger = Burger.new({'name' => 'BLT Burger', 'price' => 5.50, 'eatery_id' => burger_meats_burger.id })
blt_burger.save()

big_kahuna = Burger.new({'name' => 'Big Kahuna', 'price' => 3.75, 'eatery_id' => bobs_burgers.id })
big_kahuna.save()

big_r_burger = Burger.new({'name' => 'Bigger Burger', 'price' => 4.00, 'eatery_id' => burgers_r_us.id })
big_r_burger.save()

mc_chicken = Burger.new({'name' => 'McChicken Sandwich', 'price' => 4.20, 'eatery_id' => mcdonalds.id })
mc_chicken.save()

big_mac = Burger.new({'name' => 'Big Mac', 'price' => 4.20, 'eatery_id' => mcdonalds.id })
big_mac.save()

###Deals data

two_for_one_tuesday = Deal.new({'deal_name' => 'Two for one', 'day' => 'Tuesday', 'eatery_id' => burger_meats_burger.id })
two_for_one_tuesday.save()

two_for_one_thursday = Deal.new({'deal_name' => 'Two for one', 'day' => 'Thursday', 'eatery_id' => burger_meats_burger.id })
two_for_one_thursday.save()

twenty_five_percent_off = Deal.new({'deal_name' => '25% off', 'day' => 'Friday', 'eatery_id' => bobs_burgers.id })
twenty_five_percent_off.save()

start_the_week_deal = Deal.new({'deal_name' => 'Start the week', 'day' => 'Monday', 'eatery_id' => bobs_burgers.id })
start_the_week_deal.save()

bogof = Deal.new({'deal_name' => 'Buy one get one free', 'day' => 'Wednesday', 'eatery_id' => burgers_r_us.id })
bogof.save()

happy_tuesday = Deal.new({'deal_name' => 'Happy Tuesday', 'day' => 'Tuesday', 'eatery_id' => mcdonalds.id })
happy_tuesday.save()

### Burgers_deals
two_for_one_royale_tuesday = BurgerDeal.new({'deal_id' => two_for_one_tuesday.id, 'burger_id' => royale.id})
two_for_one_royale_tuesday.save()

two_for_one_blt_tuesday = BurgerDeal.new({'deal_id' => two_for_one_tuesday.id, 'burger_id' => blt_burger.id})
two_for_one_blt_tuesday.save()

two_for_one_whopper_thursday = BurgerDeal.new({'deal_id' => two_for_one_thursday.id, 'burger_id' => whopper.id})
two_for_one_whopper_thursday.save()

start_the_week_big_mack = BurgerDeal.new({'deal_id' => start_the_week_deal.id, 'burger_id' => big_mack.id})
start_the_week_big_mack.save()

twenty_five_percent_kahuna = BurgerDeal.new({'deal_id' => twenty_five_percent_off.id, 'burger_id' => big_kahuna.id})
twenty_five_percent_kahuna.save()

bogof_big_r = BurgerDeal.new({'deal_id' => bogof.id, 'burger_id' => big_r_burger.id})
bogof_big_r.save()

happy_tuesday_mcchicken = BurgerDeal.new({'deal_id' => happy_tuesday.id, 'burger_id' => mc_chicken.id})
happy_tuesday_mcchicken.save()
