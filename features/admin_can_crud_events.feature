Feature: Admin can CRUD events
  Background:
    Given I am logged in as an admin
    And a team exists with name: "Avengers"

  Scenario: Create Event
    When I go to the "admin events" page
    And I click on "Create Event"
    And I fill in "Name" with "Test Event"
    And I select "Avengers" from "Team"
    And I press "Create"
    Then I should be on the "admin events" page
    And I should see "Test Event"
    And I should see "Avengers"

  Scenario: Edit Event
    Given an event with name "Some bonus event" exists
    And I go to the "admin events" page
    When I click on "Edit"
    And I fill in "Name" with "Another name for the event"
    And I press "Update"
    Then I should be on the "admin events" page
    And I should see "Another name for the event"

  Scenario: Delete Event
    Given an event with name "Some bonus event" exists
    And I go to the "admin events" page
    And I click on "Delete"
    Then I should not see "Some bonus event"
