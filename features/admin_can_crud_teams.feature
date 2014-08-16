Feature: Admin can CRUD teams
  Background:
    Given I am logged in as an admin

  Scenario: CRUD a team
    When I go to the "admin teams" page
    And I click on "Create Team"
    And I fill in "Name" with "Test Team"
    And I press "Create"
    Then I should be on the "admin teams" page
    And I should see "Test Team"
    When I click on "Edit"
    And I fill in "Name" with "Another Team Name"
    And I press "Update"
    Then I should see "Another Team Name"
    When I click on "Delete"
    Then I should not see "Another Team Name"

