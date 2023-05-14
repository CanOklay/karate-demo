Feature:

  Background:

    * url baseUrl = 'url'
    * configure headers = {username: 'username', password: 'password'}

  @name=first
  Scenario: get all users and then get the first user by id
    Given path 'users'
    When method get
    Then status 200

    * def first = response[0]

    Given path 'users', first.id
    When method get
    Then status 200

    @name=second
    Scenario: add two parameters
      Given path 'add'
      When method post
      Then status 200
