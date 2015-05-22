require 'test_helper'

class EventTest < ActiveSupport::TestCase
  
  def setup
  	@event = Event.new(title: "Foobar")
  end

  test "should be valid" do
  	assert @event.valid?
  end

  test "title should be present" do
  	@event.title = "   "
  	assert_not @event.valid?
  end

  test "title should be at most 255 characters" do
  	@event.title = "a" * 256
  	assert_not @event.valid?
  end

  test "order should be most recent first" do
    assert_equal events(:first), Event.first
  end

end
