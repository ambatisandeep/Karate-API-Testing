Feature: Labels feature

  Background:
    * url 'https://api.todoist.com/rest/v1/'
    * def headerData = { 'Content-Type' : 'application/json', 'Authorization': 'Bearer 676f2c4e5c1eca97a5559e55b8233b37427fc913'}
    * headers headerData

  Scenario: Create a label, update it and delete it
    Given path 'labels'
    When request { name : "Regular" }
    When method post
    Then status 200
    And match response contains {id: '#number'}

    * def newLabelId = response.id

    Given path 'labels',response.id
    And headers headerData
    When request { name : 'Special' }
    When method post
    Then status 204

    Given path 'labels', newLabelId
    And headers headerData
    When method delete
    Then status 204
