require('pry-byebug')
require("minitest/autorun")
require("minitest/reporters")
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative("../models/burger.rb")
require_relative("../models/eatery.rb")

class TestBurger < MiniTest::Test

  def setup
    Burger.delete_all()
    Eatery.delete_all()
    @burger_meats_burger = Eatery.new({'name' => 'Burger Meats Burger', 'location' => 'Edinburgh'})
    @burger_meats_burger.save()
    @whopper = Burger.new({'name' => 'Whopper', 'price' => 3.50, 'eatery_id' => @burger_meats_burger.id })
    @whopper.save()
    @royale = Burger.new({'name' => 'Royale', 'price' => 17.50, 'eatery_id' => @burger_meats_burger.id })
  end

  def test_burger_has_name
    assert_equal('Whopper', @whopper.name)
  end

  def test_burger_has_price
    assert_equal(3.50, @whopper.price)
  end

  def test_burger_saved_to_db
    name_pre_save = @royale.name
    @royale.save()
    found_burger = Burger.find(@royale.id)
    assert_equal(name_pre_save, found_burger.name)
  end

  def test_updated_instance_shows_changes()
    new_name = 'Big Whopper!'
    @whopper.name = new_name
    @whopper.update()
    updated_burger = Burger.find(@whopper.id)
    assert_equal(new_name, updated_burger.name)
  end

  #a db method so difficult to test well.  Calling find raises an error
  def test_deleting_an_instance()
    @whopper.delete()
    assert_raises (NoMethodError) {Burger.find(@whopper.id)}
  end

  def test_all_burgers_returns_burgers_from_db()
    all_burgers = Burger.all()
    assert_equal(1, all_burgers.size())
  end

end
