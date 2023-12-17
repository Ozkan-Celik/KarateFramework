Feature: Testing different End Points with Spartans API
  Background:
    * def spartanUrl = "http://54.172.243.231:8000/"
    * def expectedSpartan = read("classpath:examples/testData/oneSpartan.json")
  @smoke
  Scenario: Get one spartan with path parameter the verify
    Given url spartanUrl
    And path "api/spartans"
    And path "50"
    And header accept = 'application/json'
    When method get
    Then status 200
    Then match response == expectedSpartan
  @smoke
  Scenario: Execute query parameters
    Given url spartanUrl
    And path "api/spartans/search"
    And param nameContains = 'j'
    And param gender = 'Female'
    When method get
    Then status 200
    Then match each response.content[*].gender == 'Female'
    # Then match response.totalElement == 6

  @ignore
  Scenario: POST a new spartan to API and use spartan generator Java File
    When def SpartanDG = Java.type("examples.utilities.SpartanDataGenerator")
    And def newSpartan = SpartanDG.createSpartan()
    Given url spartanUrl
    And path "api/spartans"
    And header Accept = "application/json"
    And header Content-Type = "application/json"
    # following line reads the map object and turns it into JSON object
    And request newSpartan
    And method POST
    Then status 201
    And match response.success == "A Spartan is Born!"
    And match response.data.name == newSpartan.name










