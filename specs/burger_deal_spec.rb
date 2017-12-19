require('pry-byebug')
require("minitest/autorun")
require("minitest/reporters")
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative("../models/burger.rb")
require_relative("../models/eatery.rb")
require_relative("../models/deal.rb")
require_relative("../models/burger_deal.rb")

class TestBurgerDeal < MiniTest::Test

  def setup
    BurgerDeal.delete_all()
    Deal.delete_all()
    Burger.delete_all()
    Eatery.delete_all()
    @bobs_burgers = Eatery.new({'name' => 'Bobs Burgers', 'location' => 'Edinburgh'})
    @bobs_burgers.save()
    @royale = Burger.new({'name' => 'Royale', 'price' => 17.50, 'eatery_id' => @bobs_burgers.id })
    @royale.save()
    @whopper = Burger.new({'name' => 'Whopper', 'price' => 3.50, 'eatery_id' => @bobs_burgers.id })
    @whopper.save()
    @two_for_one = Deal.new({'deal_name' => 'Two for one', 'day' => 'Tuesday', 'eatery_id' => @bobs_burgers.id })
    @two_for_one.save()
    @two_for_one_royale = BurgerDeal.new({'deal_id' => @two_for_one.id, 'burger_id' => @royale.id})
    @two_for_one_royale.save()
  end

  def test_burger_deal_saved_to_db
    burger_deal_deal_id_pre_save = @two_for_one_royale.deal_id
    @two_for_one_royale.save()
    found_burger_deal = BurgerDeal.find(@two_for_one_royale.id)
    assert_equal(burger_deal_deal_id_pre_save, found_burger_deal.deal_id)
  end

  def test_updated_instance_shows_changes()
    new_burger_id = @whopper.id
    @two_for_one_royale.burger_id = new_burger_id
    @two_for_one_royale.update()
    updated_burger_deal = BurgerDeal.find(@two_for_one_royale.id)
    assert_equal(new_burger_id, updated_burger_deal.burger_id)
  end

  def test_deleting_an_instance()
    @two_for_one_royale.delete()
    assert_raises (NoMethodError) {BurgerDeal.find(@two_for_one_royale.id)}
  end

  #a db method so difficult to test well.  Calling find raises an error
  def test_delete_all_returns_error_on_find()
    BurgerDeal.delete_all()
    assert_raises (NoMethodError) {BurgerDeal.find(@two_for_one_royale.id)}
  end

  def test_all_returns_burger_deals_from_db()
    all_burger_deals = BurgerDeal.all()
    assert_equal(1, all_burger_deals.size())
  end


end
