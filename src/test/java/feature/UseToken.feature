Feature: use token

  Background:
    Given url 'https://conduit.productionready.io/api'
    * def articleRequestBody = read('classpath:feature/json/newArticleRequest.json')
    * def dataGenerator = Java.type('helper.DataGenerator')
    * set articleRequestBody.article.title = dataGenerator.getRandomArticleValues().title
    * set articleRequestBody.article.description = dataGenerator.getRandomArticleValues().description
    * set articleRequestBody.article.body = dataGenerator.getRandomArticleValues().body
    * def tokenResponse = call-once read('classpath:helpers/CreateToken.feature') {"email": karate@test.com, "password": "karate123"}
    * def token = tokenResponse.authToken

  Scenario: Create a new article

    Given header Authorization = 'Token ' + token
    Given path 'articles'
    And request articleRequestBody
    When method post
    Then status 200
    And match response.article.title == articleRequestBody.article.title

  Scenario: Create a new article

    Given header Authorization = 'Token ' + token
    Given path 'articles'
    And request articleRequestBody
    When method post
    Then status 200
    And match response.article.title == articleRequestBody.article.description