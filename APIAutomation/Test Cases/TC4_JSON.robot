*** Settings ***
Library      JSONLibrary
Library      os
Library      Collections


*** Test Cases ***
Testcase1:
       ${json_obj}   load json from file    C:/Users/nisch/PycharmProjects/APIAutomation/Test Cases/jsondata.json
       log to console    ${json_obj}
       ${resp}  get value from json    ${json_obj}       $.lastName
       log to console    ${resp[0]}
       should be equal    ${resp[0]}      Smith



       ${name_value}     get value from json    ${json_obj}      $.address.streetAddress
       log to console    ${name_value}
       should be equal    ${name_value[0]}    21 2nd street


       ${num}      get value from json      ${json_obj}       $.phoneNumber[1].type
       log to console    ${num[0]}



