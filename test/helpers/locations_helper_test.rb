require 'test_helper'

class LocationsHelperTest < ActionView::TestCase

  setup do
    @corner_store = locations :corner_store
  end

  test 'should get the number of locations per row' do
    assert_equal 4, LocationsHelper::LOCATIONS_PER_ROW
  end

  test 'should get the width of each location' do
    assert_equal 3, LocationsHelper::LOCATION_WIDTH
  end

  test 'should get a location\'s hours during the week' do
    assert_equal '8:00 am to 2:00 am', weekday_hours_for(@corner_store)
  end

  test 'should get a location\'s hours during the weekend' do
    assert_equal '10:30 am to 2:00 am', weekend_hours_for(@corner_store)
  end

end
