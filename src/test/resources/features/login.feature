Feature: Login Functionality
  In order to test the login page
  As a registered or authorized user
  I want to verify the login conditions


  Scenario Outline: Login with valid credentials
    Given User is on a login page
    When User enter valid "<Email address>" in Email address field
    And User enter valid "<Password>" in Password field
    And User clicks on checkbox to show password
    And User clicks on "<Sign in securely>" button
    Then User should navigate to User Account page

    Examples:
      | Email address             | Password     |
      | matsukirina1.20@gmail.com | NewPassw0rd1 |


  Scenario Outline: Login with invalid credentials validation empty fields
    Given User left "<Email address>" or "<Password>" fields empty

    When User click on "Sign in securely" button
    Then User should get an error message "Please enter your password" or "Please enter your email address"
    And Login attempt should fail
    Examples:
      | Email address         | Password     |
      | matsukirina@gmail.com |              |
      |                       | NewPassw0rd1 |

  Scenario Outline: Login with invalid Email address
    Given User enter an invalid value for "<Email address>"
    And User go to Password field
    Then User should get an error message "Please ensure you have entered the correct email address"
    And Login attempt should fail
    Examples:
      | Email address |
      | matsuk@m      |

  Scenario Outline: Login with invalid Password
    Given User enter an valid value for "<Email address>"
    And User enter invalid "<Password>" in Password field
    And User click on "Sign in securely" button
    Then User should get an error message "Sorry we could not log you in. Please try entering your account details again. If you can't remember your password please reset your password"
    And Login attempt should fail
    Examples:
      | Email address         | Password |
      | matsukirina@gmail.com | Passw0rd |


  Scenario Outline: Login with invalid Email address and invalid Password
    Given User enter an invalid value for "<Email address>" in Email address field
    And User enter invalid "<Password>" in Password field
    And User click on "Sign in securely" button
    Then User should get an error message "Sorry we could not log you in. Please try entering your account details again. If you can't remember your password please reset your password"
    And Login attempt should fail
    Examples:
      | Email address   | Password |
      | matsukira@.mail | Passw0rd |

