Feature:

  Background:
    * url 'https://api.todoist.com/rest/v1/'
    * def headerData = { 'Content-Type' : 'application/json', 'Authorization': 'Bearer 27892e10d2dac56dbfba9d6ac01dd2a8d387e270'}
    * headers headerData

    @Task
  Scenario: Create a task
      Given path 'tasks'
      And headers headerData
      And request {"content": "Billing Payments","due_string": "tomorrow at 18:00","due_lang": "en","priority": 2}
      When method POST
      Then status 200
      And print response
      And assert response.content !=null
      And match response.project_id == 2270127721

    @Task
  Scenario: Update a task
    Given path 'tasks/5056010245'
    And headers headerData
    And request {"content": "Birthday Alert","due_string": "next month at 17:00" ,"priority": 3}
    When method POST
    Then status 204
    And print response
    And match response.priority !=1






