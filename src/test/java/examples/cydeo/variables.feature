Feature: Learning Basics with Karate Framework

  Scenario: Test Variables
    Given print "hello world"
    When def result = 2 + 2
    Then print result
    # all same with arithmetic operations of Java
    And def name = 'Michael'
    * print name," Hello"
    # single or double quotation does not matter
    And def age = 30
    # we are using all kind of Data Types just one key word 'def'
    * def oneSpartan =
    """
    {
    "id": 50,
    "name": "Jennica",
    "gender": "Female",
    "phone": 6986436734
    }
    """
    Then print oneSpartan.name

@smoke
  Scenario: Read a data from a file
    When def spartans = read("classpath:examples/testData/fourSpartans.json")
    * print spartans
    * print spartans[2].name
  # json array object is indexed based starts from zero

