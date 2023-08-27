*** Setting ***
Documentation         Global resources
Library               SeleniumLibrary        timeout=15s    run_on_failure=Capture Page Screenshot     screenshot_root_directory=${SCREENSHOT_PATH}
Library               FakerLibrary

*** Variables ***
${SCREENSHOT_PATH}        screenshots
${HOST}                   http://localhost:8080
${BROWSER}                chrome

*** Keywords ***
Open Chrome Browser
  [Arguments]         ${url}    ${web_browser}=${BROWSER}
  Open Browser        ${url}    ${web_browser}        options=add_argument("lang=id");add_argument("--disable-web-security");add_argument("--allow-running-insecure-content");add_argument("--disable-dev-shm-usage");add_argument("--incognito");page_load_strategy("eager")
  Set Window Size        1366        768

Get CSS Property Value
  [Documentation]
  ...    Get the CSS property value of an Element.
  ...    
  ...    This keyword retrieves the CSS property value of an element. The element
  ...    is retrieved using the locator.
  ...    
  ...    Arguments:
  ...    - locator           (string)    any Selenium Library supported locator xpath/css/id etc.
  ...    - property_name     (string)    the name of the css property for which the value is returned.
  ...    
  ...    Returns             (string)    returns the string value of the given css attribute or fails.
  ...    Usage Example:
  ...      Assert Button Color Match With Canva Requirement
  ...         ${style}=    Get CSS Property Value    xpath=//button[@data-test-id='btnSignInSubmit']    color
  ...         Should Be Equal As Strings     ${style}        rgba(145, 158, 171, 0.8)
  ...
  [Arguments]    ${locator}    ${attribute name}
  ${css}=         Get WebElement    ${locator}
  ${prop_val}=    Call Method       ${css}    value_of_css_property    ${attribute name}
  [Return]        ${prop_val}
