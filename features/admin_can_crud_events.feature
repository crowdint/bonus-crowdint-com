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
