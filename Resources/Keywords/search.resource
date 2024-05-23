*** Settings ***
Library     AppiumLibrary
 

Resource    ../Repostiories/search.resource
Resource    ../Testdata/search.resource

*** Keywords ***
Open_Application_AIS_PLAY
    Open Application    
    ...    remote_url=http://127.0.0.1:4723/wd/hub   
    ...    platformName=Android
    ...    platformVersion=14
    ...    deviceName=R9WWA03R8AL 
    ...    appPackage=com.ais.mimo.AISPlay  
    ...    appActivity=net.vimmi.lib.ui.main.MainActivity
    ...    fullReset=false
    ...    automationName=UiAutomator2

Click_Iam_Guest
    Click Element  ${btn_guest}

Click_Accept_Conditions
    Wait Until Page Contains Element    ${btn_conditions}
    Click Element    ${btn_conditions}

Click_Series
    Wait Until Page Contains Element    ${btn_series}
    Click Element    ${btn_series}

Swipe_Down_To_Horror_Series
    Swipe    350    1597    350    0    
    Swipe    350    1597    350    0    
    Swipe    350    20      350    0    

Click_Choose_Series
    Wait Until Page Contains Element    ${btn_choose_series}
    Click Element    ${btn_choose_series}

Verifies_Series
    [Arguments]    ${Ver_Se}
    Wait Until Page Contains Element    ${lbl_verify_series}
    Element Text Should Be    ${lbl_verify_series}    ${Ver_Se}

Click_Episode
    Wait Until Page Contains Element    ${btn_ep1/4}
    Click Element    ${btn_ep1/4}

Verifies_Series_Episode
    [Arguments]    ${Ver_Ep}
    Element Text Should Be    ${lbl_verify_series_ep1/4}    ${Ver_Ep}

Press Play Series
    Click Element    ${btn_play}    

Verify Play Series
    # Wait Until Element Is Visible     ${btn_pause}    10s
    # Click Element    ${btn_time_container}
    # Wait Until Page Contains Element    ${btn_framelayout}  
    # Click Element    ${btn_framelayout}
    Wait Until Page Contains Element    ${lbl_time_current}     10s
    ${before}    Get Text    ${lbl_time_current}   
    Wait Until Page Does Not Contain Element    ${btn_pause}    20s
    Click Element    ${btn_framelayout}  
    ${after}    Get Text    ${lbl_time_current}
    ${before}     Split String    ${before}    :
    ${before_seconds}    Convert to number    ${before}[1]
    ${after}      Split String    ${after}    :
    ${after_seconds}    Convert to number     ${after}[1]
    IF    ${after_seconds} > ${before_seconds}
    Log    ture
    ELSE    
        Fail
    END


# Press And Verify Forward Series
#     ${before}    Get Text    ${lbl_time_current}
#     Click Element    ${btn_forward}
#     ${after}    Get Text    ${lbl_time_current}
#         IF    '${after}' > '${before}' + '00:15'
#     Log    ture
#     ELSE    
#         Fail
#     END

# Press And Verify Backward Series
#     ${before}    Get Text    ${lbl_time_current}
#     Click Element    ${btn_backward}
#     ${after}    Get Text    ${lbl_time_current}
#         IF    '${after}' < '${before}' 
#     Log    ture
#     ELSE    
#         Fail
#     END

# Press Pause And Verify
#     ${before}    Get Text    ${lbl_time_current}
#     Click Element    ${btn_pause}
#     Wait Until Page Does Not Contain Element    ${btn_pause}    20s
#     Click Element    ${btn_framelayout}  
#     ${after}    Get Text    ${lbl_time_current}
#         IF    '${after}' == '${before}'
#     Log    ture
#     ELSE    
#         Fail
#     END

# Drag Progress bar Forward
#     ${element_size}    Get Element Size    class=android.widget.SeekBar
#     ${element_location}    Get Element Location    class=android.widget.SeekBar
#     ${start_x}         Evaluate      ${element_location['x']} + (${element_size['width']} * 0.1)
#     ${start_y}         Evaluate      ${element_location['y']} + (${element_size['height']} * 0.1)
#     ${end_x}           Evaluate      ${element_location['x']} + (${element_size['width']} * 1)
#     ${end_y}           Evaluate      ${element_location['y']} + (${element_size['height']} * 0.1)
#     Swipe              ${start_x}    ${start_y}  ${end_x}  ${end_y}  500

# Drag Progress bar Backward
#     ${element_size}    Get Element Size    class=android.widget.SeekBar
#     ${element_location}    Get Element Location    class=android.widget.SeekBar
#     ${start_x}         Evaluate      ${element_location['x']} + (${element_size['width']} * 1)
#     ${start_y}         Evaluate      ${element_location['y']} + (${element_size['height']} * 0.1)
#     ${end_x}           Evaluate      ${element_location['x']} + (${element_size['width']} * 0.1)
#     ${end_y}           Evaluate      ${element_location['y']} + (${element_size['height']} * 0.1)
#     Swipe              ${start_x}    ${start_y}  ${end_x}  ${end_y}  500
    

 


    



  
           

