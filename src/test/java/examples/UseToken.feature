Feature: use token

  Background:
    Given url 'https://conduit.productionready.io/api'
    * def tokenResponse = call-once read('classpath:helpers/CreateToken.feature') {"email": karate@test.com, "password": "karate123"}
    * def token = tokenResponse.authToken

  Scenario: Create a new article

    Given header Authorization = 'Token ' + token
    Given path 'articles'
    And request
    """
    {
    "article": {
    "tagList": [],
    "title": "Bla bla",
    "description": "test test",
    "body": "body"}
    }
    """
    When method post
    Then status 200
    And match response.article.title == 'Bla bla'