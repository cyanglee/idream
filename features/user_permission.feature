Feature: Test user permissions
  In order to use the system function
  As a user
  I want to sign up and login

#  Scenario: User Registration
#    When I go to the home page
#    And I follow "Sign up"
#    And I fill in the following:
#      | Email                 | lee55@indiana.edu |
#      | password              | 123456            |
#      | password_confirmation | 123456            |
#    And the following volunteer exists:
#      | Name | User |
#      | Volunteer | Email: lee55@indiana.edu |
#    And a role exists with name: "Volunteer"
#    And a user exists with role: "Voluneer"
#    And a person exists with company: company "rubyflare"
#    And I press "Sign up"
#    And I should see "Welcome! You have signed up successfully."
#    Then show me the page


  Scenario: User Sign in
    Given the following user exists:
      | email                | password |
      | cyoung.lee@gmail.com | 123456   |
    When I go to the home page
    And I follow "Sign in"
    And I am logged in as "cyoung.lee@gmail.com" with password "123456"
    And I should see "Signed in successfully"


