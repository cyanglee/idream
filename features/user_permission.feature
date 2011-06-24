Feature: Test user permissions
  In order to use the system function
  As a user
  I want to sign up and login

#  Scenario: User Registration
#    When I go to the home page
#    And I follow "Sign up"
#    And I fill in the following:
#      | Email                 | cyoung.lee@gmail.com |
#      | password              | 123456               |
#      | password_confirmation | 123456               |
#    And I choose "Volunteer"
#    And I press "Sign up"
#    And I should see "Welcome! You have signed up successfully."


  Scenario: User Sign in
    Given the following user exists:
      | email                | password |
      | cyoung.lee@gmail.com | 123456   |
    When I go to the home page
    And I follow "Sign in"
    And I am logged in as "cyoung.lee@gmail.com" with password "123456"
    And I should see "Signed in successfully"


