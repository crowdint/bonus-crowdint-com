Feature: User can award points
  Background:
    Given a user exists with name: "Buzzbee Spider"
    And I am logged in as a user
    And I am part of a team with name: "Avengers"
    And an event exists with name: "Points for July 2014"
    And the event is assigned to team "Avengers"

  Scenario: Award points
    Given I am on the "root" page
    And I click on "Points for July 2014"
    And I click on "Award"
    And I select "Buzzbee Spider" from "Receiver"
    And I fill in "Points" with "100"
    When I press "Create"
    Then I should see "Buzzbee Spider 100"

  Scenario: Edit Award
    Given an award for "50" has been given to "Buzzbee Spider"
    And I am on the "events" page
    And I click on "Points for July 2014"
    And I click on "Edit"
    And I fill in "Points" with "50"
    When I press "Update"
    Then I should see "Buzzbee Spider 50"

  Scenario: Destroy Award
    Given an award for "50" has been given to "Buzzbee Spider"
    And I am on the "events" page
    And I click on "Points for July 2014"
    When I click on "Delete"
    Then I should not see "Buzzbee Spider 50"

  Scenario: User can't award more points than available
    Given an award for "90" has been given to "Buzzbee Spider"
    And a user exists with name: "Ruby Bee"
    And I am on the "events" page
    And I click on "Points for July 2014"
    And I click on "Award"
    And I select "Ruby Bee" from "Receiver"
    And I fill in "Points" with "100"
    When I press "Create"
    Then I should see "The award excedes your available points"

  Scenario: User can't award less points than minimum
    Given I am on the "root" page
    And I click on "Points for July 2014"
    And I click on "Award"
    And I select "Buzzbee Spider" from "Receiver"
    And I fill in "Points" with "1"
    When I press "Create"
    Then I should see "You must assign at least 10 points"
