# new feature
# Tags: optional

Feature: Test nasa free api

  Scenario: get 200 status
    Given url 'https://api.nasa.gov/planetary/apod?api_key=waSCLMWEDEpIqclfyEBjYZMHZh3TzPsE2e26VZhf'
    When method get
    Then status 200

  Scenario: get 403 forbidden error
    Given url 'https://api.nasa.gov/planetary/apod?api_key=waSCLMWEDEpIqclfyEBjYZMHZh3TzPsE2ef'
    When method get
    Then status 403

  Scenario: verify json date field
    Given url 'https://api.nasa.gov/planetary/apod?api_key=waSCLMWEDEpIqclfyEBjYZMHZh3TzPsE2e26VZhf'
    When method get
    Then status 200
    * def getDate =
                """
                function() {
                  var SimpleDateFormat = Java.type('java.text.SimpleDateFormat');
                  var sdf = new SimpleDateFormat('yyyy-MM-dd');
                  var date = new java.util.Date();
                  return sdf.format(date);
                }
                """
    And match response.date == getDate()

