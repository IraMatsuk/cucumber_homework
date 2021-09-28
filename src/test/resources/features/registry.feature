Feature: Registry Functionality
  In order to test the login page
  As a New customer
  I want to verify the registry conditions

  Background:
    Given User is on a login/registry page

  Scenario Outline: Registry with valid credentials
    When User enter valid "<Email address>" in Email address field
    And User click on Continue button
    Then User should navigate on Wiggle Customer Service page
    Then User enter valid "<Email address>" to confirming user's email address
    And User enter valid "<Password>" in "Create a password" field
    And User enter "<First name>"
    And User enter "<Last name>"
    And User clicks on Continue button
    Then User should navigate to User Account page

    Examples:
      | Email address             | Email address             | Password     | First name | Last name |
      | matsukirina1.20@gmail.com | matsukirina1.20@gmail.com | NewPassw0rd1 | Iryna      | Matsuk    |


  Scenario Outline: Registry with invalid credentials
    When User enter valid "<Email address>" in Email address field
    And User click on Continue button
    Then User should navigate on Wiggle Customer Service page
    Then User enter invalid "<Email address>" to confirm user's email address field
    And User go to "<Password>" in "Create a password" field
    Then User get an error message "Please ensure your email addresses match"
    Then User enter invalid "<Password>" in "Create a password" field
    Then User get an error message "Please ensure you have entered a password with at least 6 characters containing both letters and numbers"
    Then User enter invalid "<First name>" including symbols
    Then User get an error message "Symbols like ( !@£$%^&*_+§¡€#¢¶«»\/<>?:;|=[]{}()~" ) are not allowed"
    Then User enter invalid "<Last name>" including symbols
    Then User get an error message "Symbols like ( !@£$%^&*_+§¡€#¢¶«»\/<>?:;|=[]{}()~" ) are not allowed"
    And User clicks on Continue button
    Then User see all previous error messages
    But User should not navigate to User Account page
    Examples:
      | Email address    | Email address | Password | First name | Last name |
      | matsuk@gmail.com | matsuk@mail   | Pass     | Ir==yna    | Mat==suk  |
