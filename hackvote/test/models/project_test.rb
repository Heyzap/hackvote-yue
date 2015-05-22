require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  
  def setup
  	@event = events(:example)
  	@project = @event.projects.build(name: "foobar", creators: "me")
  end

  test "should be valid" do
  	assert @project.valid?
  end

  test "event id should be present" do
    @project.event_id = nil
    assert_not @project.valid?
  end

  test "project name should be present" do
  	@project.name = "   "
  	assert_not @project.valid?
  end

  test "project name should be no longer than 255 characters" do
  	@project.name = "a" * 256
  	assert_not @project.valid?
  end

  test "project creators should be present" do
  	@project.creators = "    "
  	assert_not @project.valid?
  end

  test "project creators should be no longer than 255 characters" do
  	@project.creators = "a" * 256
  	assert_not @project.valid?
  end

end