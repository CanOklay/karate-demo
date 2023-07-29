Feature: Dummy

  Scenario: Dummy
    * def dataGenerator = Java.type('helper.DataGenerator')
    * def username = dataGenerator.getRandomUsername()