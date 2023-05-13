*** Settings ***

Library    RequestsLibrary
Library    Collections

*** Variables ***
${base_url}     http://localhost:9096
${city}     delhi


*** Test Cases ***
Get_WeatherInfo
        create session  myssion     ${base_url}
        ${response}=     get request    myssion      /api/v1/weather/${city}
        #log to console    ${response.status_code}
        #log to console    ${response.content}
        #log to console    ${response.headers}


        #Validations
        ${status_code}=     convert to string    ${response.status_code}
        should be equal    ${status_code}       200



        ${body}=     convert to string    ${response.content}
        should contain      ${body}     delhi

        get from dictionary    ${response.headers}      Content-Type

        ${val}=        get from dictionary    ${response.headers}       Content-Type

        should be equal    ${val}       application/json




