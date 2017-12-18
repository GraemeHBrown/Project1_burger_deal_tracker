require('pry-byebug')
require("minitest/autorun")
require("minitest/reporters")
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative("../models/eatery.rb")
require_relative("../models/burger.rb")
require_relative("../models/deal.rb")

class TestEatery < MiniTest::Test

  def setup
    Deal.delete_all()
    Burger.delete_all()
    Eatery.delete_all()
    @bobs_burgers = Eatery.new({'name' => 'Bobs Burgers', 'location' => 'Edinburgh'})
    @bobs_burgers.save()
    @burgers_r_us = Eatery.new({'name' => 'Burgers R Us', 'location' => 'Edinburgh'})
    @burgers_r_us.save()
    @burger_meats_burger = Eatery.new({'name' => 'Burger Meats Burger', 'location' => 'Edinburgh'})
    @royale = Burger.new({'name' => 'Royale', 'price' => 17.50, 'eatery_id' => @bobs_burgers.id })
    @royale.save()
    @whopper = Burger.new({'name' => 'Whopper', 'price' => 3.50, 'eatery_id' => @bobs_burgers.id })
    @whopper.save()
    @two_for_one = Deal.new({'deal_name' => 'Two for one', 'day' => 'Tuesday', 'burger_id' => @royale.id })
    @two_for_one.save()
  end

  def test_eatery_has_name
    assert_equal('Bobs Burgers', @bobs_burgers.name)
  end

  def test_eatery_has_location
    assert_equal('Edinburgh', @burgers_r_us.location)
  end

  def test_eatery_saved_to_db
    name_pre_save = @burger_meats_burger.name
    @burger_meats_burger.save()
    found_eatery = Eatery.find(@burger_meats_burger.id)
    assert_equal(name_pre_save, found_eatery.name)
  end

  def test_all_eateries_returns_eateries_from_db()
    all_eateries = Eatery.all()
    assert_equal(2, all_eateries.size())
  end

  def test_find_returns_an_eatery()
    name = @bobs_burgers.name
    found_eatery = Eatery.find(@bobs_burgers.id)
    assert_equal(name, found_eatery.name)
  end

  #a db method so difficult to test well.  Calling find raises an error
  def test_deleting_an_instance()
    @bobs_burgers.delete()
    assert_raises (NoMethodError) {Eatery.find(@bobs_burgers.id)}
  end

  #a db method so difficult to test well.  Calling find raises an error
  def test_delete_all_returns_error_on_find()
    Eatery.delete_all()
    assert_raises (NoMethodError) {Eatery.find(@bobs_burgers.id)}
    assert_raises (NoMethodError) {Eatery.find(@burgers_r_us.id)}
  end

  def test_updated_instance_shows_changes()
    new_name = 'Burger meats Burger'
    @burgers_r_us.name = new_name
    @burgers_r_us.update()
    updated_eatery = Eatery.find(@burgers_r_us.id)
    assert_equal(updated_eatery.name, new_name)
  end

  def test_burgers_returns_burgers_for_eatery()
    found_burgers = @bobs_burgers.burgers()
    assert_equal(2, found_burgers.size())
  end

  def test_deals_returns_deals_for_eatery()
    found_deals = @bobs_burgers.deals()
    assert_equal(1, found_deals.size())
  end


end
