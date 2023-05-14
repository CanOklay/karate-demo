Feature:

  Background:

    * url 'http://localhost:3000'
    * configure headers = {username: 'username', password: 'password'}

  @name=first
  Scenario: get all users and then get the first user by id
    Given path 'users'
    When method get
    Then status 200

    * def userId = response[0]

    Given path 'users/:userId'
    When method get
    Then status 200

  @name=second
  Scenario: add two parameters
    Given params {first: 1, second: 2}
    Given path 'add'
    When method post
    Then status 200
    And match response.result == 3

  @name=third
  Scenario: sum of parameters
    Given param sumValue = 5
    Given path 'sum/:sumValue'
    When method get
    Then status 200
    And match response.result == 15

  @name=fourth
  Scenario: division of parameters
    Given params {first: 55, second: 11}
    Given path 'division'
    When method post
    Then status 200
    And match response.result == 5

  @name=fifth
  Scenario: subtraction of parameters
    Given params {first: 5, second: 2}
    Given path 'subtraction'
    When method post
    Then status 200
    And match response.result == 3