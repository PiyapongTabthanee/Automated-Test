*** Settings ***
Resource    ../Resources/Keywords/search.resource


*** Test Cases ***
Appium001 Open And Play Vido
    [Tags]    007
    Open_Application_AIS_PLAY
    Click_Iam_Guest
    Click_Accept_Conditions 
    Click_Series 
    Swipe_Down_To_Horror_Series   
    Click_Choose_Series
    Verifies_Series            ${text_series1}
    Click_Episode
    Verifies_Series_Episode    ${text_ep1/4}
    Press Play Series        
    Verify Play Series               
    Press And Verify Forward Series   
    Press And Verify Backward Series
    Press Pause And Verify
    Drag Progress bar Forward
    Drag Progress bar Backward
    
     
  
    



  

