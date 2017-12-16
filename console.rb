require('pry-byebug')
require_relative('./models/eatery.rb')

bobs_burgers = Eatery.new({'name' => 'Bobs Burgers', 'location' => 'Edinburgh'})
bobs_burgers.save()

burgers_r_us = Eatery.new({'name' => 'Burgers R Us', 'location' => 'Edinburgh'})
burgers_r_us.save()

all_eateries = Eatery.all()

found_eatery = Eatery.find(bobs_burgers.id)

###test for deletion of instance
bobs_burgers.delete()
begin
   Eatery.find(bobs_burgers.id)
rescue => e
  if e.class.name == 'NoMethodError'
    p"----------Delete successful can't call find on nil object."
  else
    p "---------Delete failed."
  end
end

###test for update
new_name = 'Burger meats Burger'
burgers_r_us.name = new_name
burgers_r_us.update()
updated_eatery = Eatery.find(burgers_r_us.id)
if updated_eatery.name == new_name
  p "---------Name updated successfully."
else
  p "---------Updated failed!"
end


binding.pry
nil
