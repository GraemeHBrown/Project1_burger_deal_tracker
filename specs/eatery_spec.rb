require('pry-byebug')
require("minitest/autorun")
require("minitest/reporters")
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative("../models/eatery.rb")

class TestEatery < MiniTest::Test

  def setup
    Eatery.delete_all()
    @bobs_burgers = Eatery.new({'name' => 'Bobs Burgers', 'location' => 'Edinburgh'})
    @bobs_burgers.save()
    @burgers_r_us = Eatery.new({'name' => 'Burgers R Us', 'location' => 'Edinburgh'})
    @burgers_r_us.save()

  end

  def test_eatery_has_name
    assert_equal('Bobs Burgers', @bobs_burgers.name)
  end

  def test_eatery_has_location
    assert_equal('Edinburgh', @burgers_r_us.location)
  end

  #this is db method so can't be tested directly
  def test_eatery_saved_to_db
    @bobs_burgers.save()
  end

  #For documentary purposes.
  def test_all_eateries_returns_eateries_from_db()
    skip "numbers will change and break test."
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

  def test_updated_instance_shows_changes()
    new_name = 'Burger meats Burger'
    @burgers_r_us.name = new_name
    @burgers_r_us.update()
    updated_eatery = Eatery.find(@burgers_r_us.id)
    assert_equal(updated_eatery.name, new_name)
  end


end
