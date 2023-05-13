*** Settings ***
Library     JSONLibrary
Library     os
Library     Collections
Library     RequestsLibrary


*** Variables ***
${base_url}     http://localhost:8080


*** Test Cases ***
Get_INfo
        create session     mysesh       ${base_url}
        ${header}=      create dictionary    Accept=application/json
        ${response}=        get request    mysesh       /app/videogames     headers=${header}
        log to console    ${response.content}

        ${jsonobj}=         to json     ${response.content}


        log to console    ${jsonobj}

        ${some}=        get value from json       ${jsonobj}        $[0].name

        log to console    ${some[0]}

        should be equal    ${some[0]}       Resident Evil 4



