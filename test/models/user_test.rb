require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    @user = Fabricate(:user)
  end

  test "user events" do
    teams  = [Fabricate(:team), Fabricate(:team)]
    events = []

    teams.each do |team|
      events << Fabricate(:event, team: team)
      team.users << @user
    end

    assert_equal true, @user.events.include?(events[0])
    assert_equal true, @user.events.include?(events[1])

  end
end
