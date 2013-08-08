Feature: new user signup
  As a non user
  I want to signup
  So that I can use the site

  Scenario: get to sign up page
    Given I am not signed in
    When I get to the homepage
    Then I should click the signup button
    And it should take me to the signup page

  Scenario: sign up
    Given I am not a user
    When I fill in correct info
    Then I should be added to the database
    And taken to the user homepage

  Scenario: Sign out
    Given I am logged in 
    When I click 'logout'
    Then I should not be logged in
