*** Settings ***
Library  RequestsLibrary
Library  Collections
Library  urllib3

*** Variables ***
${BASE_URL}  https://reqres.in/

*** Test Cases ***
Scenario: Retrieve a single user successfully
    Given The API is available
    When I send a GET request to retrieve user with ID 2
    Then The response status code should be 200
    And The response should contain user data with ID 2

Scenario: Create a new user successfully
    Given The API is available
    When I send a POST request to create a user with name "Yogi" and job "QA Engineer"
    Then The response status code should be 201
    And The response should contain the created user details

*** Keywords ***
Given The API is available
    Create Session  reqres  ${BASE_URL}

When I send a GET request to retrieve user with ID 2
    ${response}=  GET On Session  reqres  /api/users/2
    Set Test Variable  ${GET_RESPONSE}  ${response}

Then The response status code should be 200
    Should Be Equal As Numbers  ${GET_RESPONSE.status_code}  200

And The response should contain user data with ID 2
    Dictionary Should Contain Key  ${GET_RESPONSE.json()}  data
    Dictionary Should Contain Key  ${GET_RESPONSE.json()["data"]}  id
    Should Be Equal As Numbers  ${GET_RESPONSE.json()["data"]["id"]}  2

When I send a POST request to create a user with name "Yogi" and job "QA Engineer"
    ${body}=  Create Dictionary  name=Yogi  job=QA Engineer
    ${response}=  POST On Session  reqres  /api/users  json=${body}
    Set Test Variable  ${POST_RESPONSE}  ${response}

Then The response status code should be 201
    Should Be Equal As Numbers  ${POST_RESPONSE.status_code}  201

And The response should contain the created user details
    Should Be Equal  ${POST_RESPONSE.json()["name"]}  Yogi
    Should Be Equal  ${POST_RESPONSE.json()["job"]}  QA Engineer
