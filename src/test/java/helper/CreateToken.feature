Feature: Create token

  Background:
    Given url 'https://conduit.productionready.io/api'
    Given path 'users/login'
    And request
      """
      {"email": "#(email)", "password": "#(password)"}
      """
    When method post
    Then status 200
    * def authToken = response.user.token