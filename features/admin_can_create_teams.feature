Feature: Admin can CRUD teams
  Background:
    Given I am logged in as an admin

  Scenario: Create a team
    When I go to the "admin teams" page
    And I click on "Create Team"
    And I fill in "Name" with "Test Team"
    And I press "Create"
    Then I should be on the "admin teams" page
    And I should see "Test Team"
