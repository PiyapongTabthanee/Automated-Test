*** Settings ***
Library    Browser
Resource    ../Repostiories/search.resource
Resource    ../Testdata/search.resource
Resource    ../Localized/${lang}/search.resource

***Keywords***
Open_Url
    [Tags]    keyword_communicate
    Open Browser   ${url}

Input_2ver_Text
    [Tags]    keyword_action
    [Arguments]    ${text}
    Fill Text      ${id}    ${text}

Input_Text
    [Tags]    keyword_action
    Fill Text      ${id}    ${text2}

Input_Text_Lang
    [Tags]    keyword_action
    Fill Text      ${id}    ${msg_Candy}

Enter
    [Tags]    keyword_action
    Keyboard Key    press    Enter

Click_Link
    [Tags]    keyword_action
    Click    ${id3}
    Sleep    10

Verify_Text    
    [Tags]    keyword_command
    ${value}       Get Text      ${id}
    [Arguments]    ${text}
    Should Be Equal    ${value}     ${text}

Verify_Text_Lang
    [Tags]    keyword_communicate
    ${value}       Get Text      ${id}
    Should Be Equal    ${value}     ${msg_Candy}

Verify_Link
    [Tags]    keyword_command 
    ${value}    Get Url   
    Should Be Equal    ${value}    ${url3}

Click_And_Verify_Link
    [Tags]    keyword_communicate
    ${num}     Set Variable  0
    FOR    ${animal}    IN     ${lbl_link_3}    ${lbl_link_4}     ${lbl_link_5} 
        Click    ${animal}
        ${value}       Get Url
        Should Be Equal    ${value}     ${list}[${num}]
        ${num}      evaluate   ${num}+1  
        Go back
    END
    Log    Outside loopgit

Summary Number    
    [Tags]    keyword_command
    ${NUM}      Set Test Variable    0
    ${NUM}      evaluate   ${NUM}+1
    RETURN    ${NUM}

Click_Skip_And_Verify_Link
    [Tags]    keyword_communicate
    ${NUM}    Summary Number
    FOR    ${animal}    IN    ${lbl_link_3}    ${lbl_link_4}    ${lbl_link_5}       
        IF    '${animal}' == '${lbl_link_4}'
            Log    Skip
        ELSE     
            Log    Continue
            Click    ${animal}
            ${value}    Get Url
            Should Be Equal    ${value}    ${list}[${NUM}]
            Go Back
        END
    END
    Log    Outside loop
