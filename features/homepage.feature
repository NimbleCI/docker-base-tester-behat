
  Feature: Homepage is live and shows something

    Scenario: Ensure the homepage returns 200
      Given I am on the homepage
      Then the response status code should be 200