Feature: Sign up new user

  Background: Preconditions
    * def dataGenerator = Java.type('helper.DataGenerator')
    Given url apiUrl

    Scenario: New user sing up
      Given def userData = {"email":"KarateUser3@test.com", "username":"KarateUser32"}

      * def randomEmail = dataGenerator.getRandomEmail()
      * def randomUsername = dataGenerator.getRandomUsername()

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