Feature: Test Demo

  Background:
    * url 'https://jsonplaceholder.typicode.com'

  Scenario: Get users
    Given path 'users'
    When method get
    Then status 200

    * def first = response[0]

    Given path 'users', first.id
    When method get
    Then status 200
    And match response.name == "Leanne Graham"
    And match response == id: '#notnull'
    And match response.email == '#notnull'
    And match response.username == "Bret"