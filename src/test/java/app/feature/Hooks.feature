Feature: Hooks

  Background: hooks
    * def result = call read('classpath:helper/Dummy.feature')
    * def username = result.username

    #after hooks
    * configure afterScenario = function() { karate.call('classpath:helper/Dummy.feature') }
    * configure afterFeature =
    """
    function(){
        karate.log('After feature text')
    }
    """

  Scenario: First scenario
    * print username
    * print 'This is first scenario'

  Scenario: Second scenario
    * print username
    * print 'This is second scenario'