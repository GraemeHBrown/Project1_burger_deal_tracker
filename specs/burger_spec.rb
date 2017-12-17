require('pry-byebug')
require("minitest/autorun")
require("minitest/reporters")
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative("../models/burger.rb")
require_relative("../models/eatery.rb")

class TestBurger < MiniTest::Test

  def setup
    Eatery.delete_all()
    # Burger.delete_all()
    @burger_meats_burger = Eatery.new({'name' => 'Burger Meats Burger', 'location' => 'Edinburgh'})
    @burger_meats_burger.save()
    @whopper = Burger.new({'name' => 'Whopper', 'price' => 3.50, 'eatery_id' => @burger_meats_burger.id })
  end

  def test_burger_saved_to_db
    name_pre_save = @whopper.name
    @whopper.save()
    found_burger = Burger.find(@whopper.id)
    assert_equal(name_pre_save, found_burger.name)
  end


end
