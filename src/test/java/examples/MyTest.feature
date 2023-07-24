Feature: Test Demo

  Background:
    * url 'https://jsonplaceholder.typicode.com'

  @name=first
  Scenario: get all users and then get the first user by id
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
    And match response.name !contains 'can'

  @smoke
  Scenario: create a user and then get it by id

    * def user =
"""
{
    "name": "Test User",
    "username": "testuser",
    "email": "test@user.com",
    "address": {
      "street": "Has No Name",
      "suite": "Apt. 123",
      "city": "Electric",
      "zipcode": "54321-6789"
    }
}
"""

    Given url 'https://jsonplaceholder.typicode.com/users'
    And request user
    When method post
    Then status 201

    * def id = response.id
    * print 'created id is: ' + id

    And match response.name == 'Test User'
    And match response.address.street == 'Has No Name'

    Given path 'users' + id
    When method delete
    Then status 200

  Scenario: get all posts

    Given path 'posts'
    When method get
    Then status 200

  Scenario: get second page

    Given param page = 2
    Given url 'https://reqres.in/api'
    Given path 'users'
    When method get
    Then status 200
    And match response.total == 12
    And match response.total_pages == 2