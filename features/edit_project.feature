Feature: edit project
  As a user
  I want to update a project
  So I can keep track of it

  Scenario: update the title
    Given I am logged in
    And on a project page
    When I change the title
    Then it updates the project