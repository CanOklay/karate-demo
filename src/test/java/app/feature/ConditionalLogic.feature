Feature: conditional logic

  Background:
    * url apiUrl

  Scenario: conditional logic
    Given path 'articles'
    When method get
    Then status 200
    * def favoritesCount = response.articles[0].favoritesCount
    * def article = response.articles[0]

    #* if (favoritesCount == 0) karate.call('classpath:helper/AddLikes.feature', article)

    * def result = favoritesCount == 0 ? karate.call('classpath:helper/AddLikes.feature', article).likesCount : favoritesCount

    Given path 'articles'
    When method get
    Then status 200
    And match response.articles[0].favoritesCount == result
