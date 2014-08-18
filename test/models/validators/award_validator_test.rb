require 'test_helper'

class AwardValidatorTest < ActiveSupport::TestCase
  setup do
    @user     = Fabricate(:user)
    @receiver = Fabricate(:user)
    @event    = Fabricate(:event)
    Setting.points_per_participant = 100
  end

  test "can't assign more than the allowed points" do
    award = @event.awards.build
    award.user = @user
    award.receiver = @receiver
    award.points = 1000
    assert !award.valid?, "Record should be invalid"
  end

  test "can assign points for the same user even if already assigned on another event" do
    award = @event.awards.build
    award.user = @user
    award.receiver = @receiver
    award.points = 100
    award.save

    other_event = Fabricate(:event)
    award = other_event.awards.build
    award.user = @user
    award.receiver = @receiver
    award.points = 100
    assert award.valid?, "Record should be valid"
  end
end
