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

  test 'should know if it is open during the week and weekend' do
    assert @corner_store.open_on?(:weekdays), 'it should be open'
    assert @corner_store.open_on?(:weekends), 'it should be open'
    assert_raise ArgumentError do @corner_store.open_on?(:the_moon) end
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
