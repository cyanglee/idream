Feature: Test user permissions
  In order to use the system function
  As a user
  I want to sign up and login

  Scenario: User Registration
    Given the following user exists:
      | email                | password |
      | cyoung.lee@gmail.com | 123456   |
    When I go to the home page
    And I follow "Sign in"
    And I am logged in as "cyoung.lee@gmail.com" with password "123456"
    And I should see "Signed in successfully"


