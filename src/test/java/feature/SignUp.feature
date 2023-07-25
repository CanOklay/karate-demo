Feature: Sign up new user

  Background: Preconditions
    * def dataGenerator = Java.type('helper.DataGenerator')
    * def randomEmail = dataGenerator.getRandomEmail()
    * def randomUsername = dataGenerator.getRandomUsername()
    * url apiUrl

    Scenario: New user sign up

      Given path 'users'
      And request
      """
          {
              "user": {
                  "email": #(randomEmail),
                  "password": "123Karate123",
                  "username": #(randomUsername)
              }
          }
      """
      When method post
      Then status 200

  Scenario Outline: Validate sign up error messages

    * def randomEmail = dataGenerator.getRandomEmail()
    * def randomUsername = dataGenerator.getRandomUsername()

    Given path 'users'
    And request
      """
          {
              "user": {
                  "email": "<email>",
                  "password": "<password>",
                  "username": "<username>"
              }
          }
      """
    When method post
    Then status 422
    And match response == <errorResponse>

    Examples:
      | email                | password  | username          | errorResponse                                      |
      | #(randomEmail)       | Karate123 | KarateUser123     | {"errors":{"username":["has already been taken"]}} |
      | KarateUser1@test.com | Karate123 | #(randomUsername) | {"errors":{"email":["has already been taken"]}}    |
      | KarateUser1          | Karate123 | #(randomUsername) | {"errors":{"email":["is invalid"]}}                |