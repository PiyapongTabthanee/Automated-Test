*** Settings ***
Resource    ../Resources/Keywords/search.resource

*** Test Cases ***
Search002 Open Browser 2 KeyWords     
    [Tags]    002
    Open url
    Input 2ver Text    ${Text1} 
    Enter  
    Verify Text     ${Text1}
    Open url
    Input 2ver Text   ${Text2} 
    Enter
    Verify Text     ${Text2}


Search004 Open Browser and Click link 3
    [Tags]    004
    Open url
    Input Text    
    Enter
    Click Link
    Verify Link 


Search005 Open Browser and Click link 3,4,5
    [Tags]    005
    Open url
    Input Text
    Enter
    Click and Verify Link

Search006 Open Browser
    [Tags]    006
    Open url
    Input Text    
    Enter
    Click Skip and Verify Link
    

Search007 Open Browser    
    [Tags]    007
    Open Url
    Input Text lang    
    Enter
    Verify Text lang


