require 'test_helper'

class LocationsHelperTest < ActionView::TestCase

  test 'should get the number of locations per row' do
    assert_equal 4, LocationsHelper::LOCATIONS_PER_ROW
  end

  test 'should get the width of each location' do
    assert_equal 3, LocationsHelper::LOCATION_WIDTH
  end

end
