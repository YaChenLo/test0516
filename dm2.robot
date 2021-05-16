*** Settings ***
Variables    myvar.py
*** Variables ***
${VAR}    123
${JOHN HOME}    /home/john
${JANE HOME}    /home/jane
*** Test Cases ***
Example
    Log    ${OBJECT.name}
    Log    ${OBJECT.eat('Cucumber')}
    Log    ${DICTIONARY[2]}
    ${OBJECT.name} =    Set Variable    New name    #必須是SCALAR VARIABLE
    Log    ${OBJECT.name}
    ${OBJECT.new_attr} =    Set Variable    New attribute
String
    ${string} =    Set Variable    abc
    Log    ${string.upper()}      # Logs 'ABC'
    Log    ${string * 2}          # Logs 'abcabc'

Number
    ${number} =    Set Variable    ${-2}
    Log    ${number * 10}         # Logs -20
    Log    ${number.__abs__()}    # Logs 2
#Variables inside variables
#    ${name} =    Get Name
#    Do X    ${${name} HOME}
Use builtins
    Should Be Equal      ${{len('${VAR}')}}        ${3}
    Should Be Equal      ${{int('${VAR}')}}        ${123}

Access modules
    Should Be Equal      ${{os.sep}}               ${/}
    Should Be Equal      ${{round(math.pi, 2)}}    ${3.14}
    Should Start With    ${{robot.__version__}}    3.