Feature: use token

  Background:
    Given url apiUrl
    * def articleRequestBody = read('classpath:json/newArticleRequest.json')
    * def dataGenerator = Java.type('helper.DataGenerator')
    * set articleRequestBody.article.title = dataGenerator.getRandomArticleValues().title
    * set articleRequestBody.article.description = dataGenerator.getRandomArticleValues().description
    * set articleRequestBody.article.body = dataGenerator.getRandomArticleValues().body

  Scenario: Create a new article

    Given path 'articles'
    And request articleRequestBody
    When method post
    Then status 200
    And match response.article.title == articleRequestBody.article.title

  Scenario: Create a new article

    Given path 'articles'
    And request articleRequestBody
    When method post
    Then status 200
    And match response.article.title == articleRequestBody.article.description