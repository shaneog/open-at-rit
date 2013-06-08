require 'test_helper'
require 'chronic'

class LocationTest < ActiveSupport::TestCase

  setup do
    @corner_store = locations :corner_store
  end

  #test 'should have accessible attributes'

  #test 'should be sorted by name'

  #test 'should validate its name'

  test 'should know if it is open at a certain time' do
    assert(@corner_store.open?(Chronic.parse '8 am on Monday'),   'it should be open')
    assert(@corner_store.open?(Chronic.parse '12 pm on Monday'),  'it should be open')
    assert(!@corner_store.open?(Chronic.parse '2 am on Tuesday'), 'it should be closed')

    assert(@corner_store.open?(Chronic.parse '10:30 am on Saturday'), 'it should be open')
    assert(@corner_store.open?(Chronic.parse '12 pm on Saturday'),    'it should be open')
    assert(!@corner_store.open?(Chronic.parse '2 am on Sunday'),      'it should be closed')
  end

  test 'should get its hours during the week' do
    assert_equal @corner_store.weekday_hours, '8:00 am to 2:00 am'
  end

  test 'should get its hours during the weekend' do
    assert_equal @corner_store.weekend_hours, '10:30 am to 2:00 am'
  end

  test 'should compare itself (by name) with another location' do
    assert_equal self <=> Location.new(name: 'a'), -1
    assert_equal self <=> Location.new(name: 'The Corner Store'), 0
    assert_equal self <=> Location.new(name: 'z'), 1
  end

  test 'should know if it is open during the week' do
    assert @corner_store.open_weekdays?, 'it should be open'
  end

  test 'should know if it is open during the weekend' do
    assert @corner_store.open_weekdays?, 'it should be open'
  end

  test 'should know if a certain time is a weekday' do
    assert Location.is_weekday?(Chronic.parse 'Monday'),    'it should be a weekday'
    assert Location.is_weekday?(Chronic.parse 'Tuesday'),   'it should be a weekday'
    assert Location.is_weekday?(Chronic.parse 'Wednesday'), 'it should be a weekday'
    assert Location.is_weekday?(Chronic.parse 'Thursday'),  'it should be a weekday'
    assert Location.is_weekday?(Chronic.parse 'Friday'),    'it should be a weekday'

    assert !Location.is_weekday?(Chronic.parse 'Saturday'), 'it should not be a weekday'
    assert !Location.is_weekday?(Chronic.parse 'Sunday'),   'it should not be a weekday'
  end

end
