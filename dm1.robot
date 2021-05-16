*** Variables ***
@{LIST}    a    b    c
&{DICT}    a=1    b=2    c=3
*** Keywords ***
set the value
    [teardown]    Run Keyword If    '${KEYWORD STATUS}'=='PASS'    Log    True
    Set Test Variable  ${test}  test
*** Test Cases ***
Override
    Log Many    @{LIST}
    Log Many    &{DICT}
    Set Global Variable    @{LIST}    @{EMPTY}
    Set Suite Variable     &{DICT}    &{EMPTY}
    set the value
output directory
    Log  ${OUTPUT DIR}