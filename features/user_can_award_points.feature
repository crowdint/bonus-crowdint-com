Feature: User can award points
  Background:
    Given a user with name "Buzzbee Spider"
    And I am logged in as a user
    And an event exists with name: "Points for July 2014"

  Scenario: Award points
    Given I am on the "root" page
    And I click on "Points for July 2014"
    And I click on "Award"
    And I select "Buzzbee Spider" from "Receiver"
    And I fill in "Points" with "100"
    When I press "Create"
    Then I should see "Buzzbee Spider 100"

  Scenario: Edit Award
