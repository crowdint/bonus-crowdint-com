Feature: Admin can CRUD events
  Background:
    Given I am logged in as an admin

  Scenario: Create Event
    When I go to the "admin events" page
    And I click on "Create Event"
    And I fill in "Name" with "Test Event"
    And I press "Create"
    Then I should be on the "admin events" page
    And I should see "Test Event"

  Scenario: Edit Event
    Given an event with name "Some bonus event" exists
    And I go to the "admin events" page
    When I click on "Edit"
    And I fill in "Name" with "Another name for the event"
    And I press "Update"
    Then I should be on the "admin events" page
    And I should see "Another name for the event"
