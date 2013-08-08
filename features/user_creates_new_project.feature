Feature: User creates new project
  As a current user
  I want to create a new project
  So I can manage my work

  Scenario: Get to the new project page
    Given I am logged in
    When I get to the user index page
    Then I should click the 'new project' button
    And it should take me to the new project page

  Scenario: Create new project
    Given I am logged in
    And on the new project page
    When I enter accurate new project data
    And enter click the 'save new project' button
    And I it should take me the project edit page