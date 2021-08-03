Feature:

  Background:
    * url 'https://api.todoist.com/'
    * def headerData = { 'Content-Type' : 'application/json', 'Authorization': 'Bearer 27892e10d2dac56dbfba9d6ac01dd2a8d387e270'}
    * headers headerData

    @Task
  Scenario: Create a task
      Given path 'rest/v1/tasks'
      And headers headerData
      And request {"content": "Billing Payments","due_string": "tomorrow at 18:00","due_lang": "en","priority": 2}
      When method POST
      Then status 200
      And print response
      And assert response.content !=null
      And match response.project_id == 2270127721

    @Task
  Scenario: Update a task
    Given path 'showTask?id=5042021431'
    And headers headerData
    And request {"content": "Book a flight","due_string": "next month at 14:00" ,"priority": 4}
    When method PUT
    Then status 200
    And print response
    And assert response.content !=null
    And match response.priority !=1






