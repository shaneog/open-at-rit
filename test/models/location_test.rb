require 'test_helper'
require 'chronic'

class LocationTest < ActiveSupport::TestCase

  setup do
    @corner_store = locations :corner_store
    # Force Rails to save the object so we can test with our callbacks
    @corner_store.save!
  end

  #test 'should be sorted by name'

  #test 'should validate its name'

  test 'should know if it is open at a certain time' do
    assert(@corner_store.open?(Chronic.parse '8 am on Monday'),   'it should be open at 8 am on Monday')
    assert(@corner_store.open?(Chronic.parse '12 pm on Monday'),  'it should be open at 12 pm on Monday')
    assert(@corner_store.open?(Chronic.parse '12 am on Tuesday'), 'it should be open at 12 am on Tuesday')
    assert(!@corner_store.open?(Chronic.parse '2 am on Tuesday'), 'it should be closed at 2 am on Tuesday')

    assert(@corner_store.open?(Chronic.parse '10:30 am on Saturday'), 'it should be open at 10:30 am on Saturday')
    assert(@corner_store.open?(Chronic.parse '12 pm on Saturday'),    'it should be open at 12 pm on Saturday')
    assert(@corner_store.open?(Chronic.parse '12 am on Sunday'),      'it should be open at 12 am on Sunday')
    assert(!@corner_store.open?(Chronic.parse '2 am on Sunday'),      'it should be closed at 2 am on Sunday')
  end

  test 'should know if it is open during the week and weekend' do
    assert @corner_store.open_on?(:weekdays), 'it should be open on weekdays'
    assert @corner_store.open_on?(:weekends), 'it should be open on weekends'
    assert_raise ArgumentError do @corner_store.open_on?(:the_moon) end
  end

  test 'should reset a Time\'s date back to 2000/1/1' do
    assert_nil Location.reset_date nil

    time = Chronic.parse '5 pm on Monday'
    assert_equal '2000-01-01 17:00:00 -0500', Location.reset_date(time).to_s
  end

  test 'should know if a certain time is a weekday' do
    assert Location.is_weekday?(Chronic.parse 'Monday'),    'Monday should be a weekday'
    assert Location.is_weekday?(Chronic.parse 'Tuesday'),   'Tuesday should be a weekday'
    assert Location.is_weekday?(Chronic.parse 'Wednesday'), 'Wednesday should be a weekday'
    assert Location.is_weekday?(Chronic.parse 'Thursday'),  'Thursday should be a weekday'
    assert Location.is_weekday?(Chronic.parse 'Friday'),    'Friday should be a weekday'

    assert !Location.is_weekday?(Chronic.parse 'Saturday'), 'Saturday should not be a weekday'
    assert !Location.is_weekday?(Chronic.parse 'Sunday'),   'Sunday should not be a weekday'
  end

  test 'should have its times adjusted properly' do
    assert_equal 'The Corner Store', @corner_store.name
    assert_equal Time.utc(2000, 1, 1, 13, 0,  0), @corner_store.weekday_start
    assert_equal Time.utc(2000, 1, 2, 7,  0,  0), @corner_store.weekday_end
    assert_equal Time.utc(2000, 1, 1, 15, 30, 0), @corner_store.weekend_start
    assert_equal Time.utc(2000, 1, 2, 7,  0,  0), @corner_store.weekend_end
    assert_nil @corner_store.explanation
  end

end
