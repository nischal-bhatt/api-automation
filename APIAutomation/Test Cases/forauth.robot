*** Settings ***
Library     JSONLibrary
Library     os
Library     Collections
Library     RequestsLibrary


*** Variables ***
${base_url}     http://localhost:8087


*** Test Cases ***
Get_INfo
        create session     mysesh       ${base_url}
        ${header}=      create dictionary    Accept=application/json     Authorization=Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJyQGUuY29tIiwiZXhwIjoxNjc4MjAwNDIyfQ.eFgvm3FcvXvGlVfE3F05mlkGeYme6PXCEb_0UcHyRFAIO64QJxKzlSzGi5sGzZsdWHjHUvM-CWeRd8ZOICRnUA
        ${response}=        get request    mysesh       /api/v1/auth     headers=${header}
        log to console    ${response.content}

        ${jsonobj}=       to json    ${response.content}

        log to console    ${jsonobj}

        ${some}=        get value from json       ${jsonobj}        $.auth

        log to console    ${some[0]}
        should be equal    ${some[0]}       Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJyQGUuY29tIiwiZXhwIjoxNjc4MjAwNDIyfQ.eFgvm3FcvXvGlVfE3F05mlkGeYme6PXCEb_0UcHyRFAIO64QJxKzlSzGi5sGzZsdWHjHUvM-CWeRd8ZOICRnUA




