Feature: Performance Test Demo

  Background:
    * url 'https://jsonplaceholder.typicode.com'

  @name=performance
  Scenario: Get Performance Testing Ads
    Given path 'users'
    When method GET
    Then status 200

  @name=performance
  Scenario: get all posts

    Given path 'posts'
    When method get
    Then status 200

  @name=crowd
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
      "city": "Electri",
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