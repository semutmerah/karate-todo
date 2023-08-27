*** Setting ***
Documentation         Tests to verify Tentang Aplikasi Page                   
Resource              ../resources.robot
Test Setup            Open Chrome Browser   ${HOST}
Test Teardown         Close Browser

*** Variables ***
${single_todo}      Mandiin Anak

*** Test Case ***
Successfully Create Single Todos
  Wait Until Page Contains Element    xpath=//h1[.="todos"]
  Wait Until Page Contains Element    xpath=//input[@placeholder="What needs to be done?"]
  Input Text    xpath=//input[@placeholder="What needs to be done?"]    ${single_todo}
  Press Keys    None	RETURN
  Wait Until Page Contains Element    xpath=//div[.='${single_todo}']
  # Assert default tab to all, with color blue darker
  ${style}=    Get CSS Property Value    xpath=//a[.='All']    background-color
  Should Be Equal As Strings     ${style}        rgba(13, 110, 253, 1)
  # Assert available in active tab
  Click Element    xpath=//a[.="Active"]
  Sleep   0.5s
  Wait Until Page Contains Element    xpath=//div[.='${single_todo}']
  # Assert not available in completed tab
  Click Element    xpath=//a[.="Completed"]
  Sleep   0.5s
  Wait Until Page Does Not Contain Element    xpath=//div[.='${single_todo}']
  Click Element    xpath=//a[.="All"]
  Sleep   0.5s
  [Teardown]  Teardown Create Todos

Successfully Create Multiple Todos
  Create Random Multiple Todos      10
  # Assert not available in completed tab
  Execute Javascript                window.scroll(0, 800)
  Sleep    0.5s
  Click Element    xpath=//a[.="Completed"]
  Sleep   0.5s
  Wait Until Page Does Not Contain Element    xpath=//button[@data-test-id="btnRemoveTodo"]
  Click Element    xpath=//a[.="All"]
  Sleep   0.5s
  [Teardown]    Teardown Create Todos


*** Keywords ***
Teardown Create Todos
  ${total_todos}=   Get Element Count   xpath=//button[@data-test-id="btnRemoveTodo"]
  Scroll Element Into View      xpath=//h1[.="todos"]
  FOR    ${i}    IN RANGE    ${total_todos}
    Click Element    xpath=//button[@data-test-id="btnRemoveTodo"]
    Sleep    0.5s
  END
  Wait Until Page Does Not Contain Element    xpath=//button[@data-test-id="btnRemoveTodo"]
  Close Browser

Create Random Multiple Todos
  [Arguments]   ${total_random_todos}
  FOR    ${i}    IN RANGE    ${total_random_todos}
    Wait Until Page Contains Element    xpath=//h1[.="todos"]
    Wait Until Page Contains Element    xpath=//input[@placeholder="What needs to be done?"]
    ${random_todo}=     FakerLibrary.Text   max_nb_chars=50
    Input Text    xpath=//input[@placeholder="What needs to be done?"]    ${random_todo}
    Press Keys    None	RETURN
    Wait Until Page Contains Element    xpath=//div[.='${random_todo}']
    Sleep    0.5s
  END
  