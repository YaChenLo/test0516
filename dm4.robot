*** Variables ***
@{ROBOTS}=        Bender    Johnny    Terminator    Robocop
*** Tasks ***
Continue For Loop
    FOR    ${robot}    IN    @{ROBOTS}
        Continue For Loop If    '${robot}' == 'Terminator'
        Log    ${robot}
    END

    FOR    ${robot}    IN    @{ROBOTS}    #Skips the current for loop iteration and continues from the next. 
        Run Keyword If    '${robot}' == 'Terminator'    Continue For Loop
        Log    ${robot}
    END

    FOR    ${robot}    IN    @{ROBOTS}    #Skips the current for loop iteration and continues from the next. 
        Run Keyword If    '${robot}' == 'Terminator'    Continue For Loop
        ...    ELSE    Log To Console    ${robot}
    END
