require 'test_helper'

class LocationsControllerTest < ActionController::TestCase

  setup do
    @corner_store = locations :corner_store
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns :locations
  end

end
