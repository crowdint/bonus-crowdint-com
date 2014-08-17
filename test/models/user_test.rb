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

  test "find_for_google_oauth2 when user does not exist" do
    oauth = {
      "info" => { "name" => "Peg", "email" => "peg@crowdint.com" }
    }

    User.find_for_google_oauth2(oauth)

    assert_equal 1, User.where(email: "peg@crowdint.com", name: "Peg").count
  end

  test "find_for_google_oauth2 when user exists" do
    user = Fabricate(:user, email: "peg@crowdint.com")

    oauth = {
      "info" => { "name" => user.name, "email" => user.email }
    }

    found_user = User.find_for_google_oauth2(oauth)

    assert_equal true, user == found_user
  end

  test "valid_email?" do
    assert_equal true, User.valid_email?("someone@crowdint.com")
    assert_equal false, User.valid_email?("someone@google.com")
  end
end
