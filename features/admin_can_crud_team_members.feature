Feature: Admin can CRUD team members
  Background:
    Given I am logged in as an admin
    And a user exists with name: "Human Torch"
    And a team exists with name: "Fantastic Four"

  Scenario: CRUD team members
    Given I am on the "admin teams" page
    When I click on "Members"
    And I click on "New Member"
    And I select "Human Torch" from "User"
    And I press "Create"
    Then I should see "Human Torch"
    When I click on "Delete"
    Then I should not see "Human Torch" within the member list
