*** Settings ***
Library     RequestsLibrary
Library     Collections


*** Variables ***
${base_url}=        http://localhost:9096


*** Test Cases ***
Put_CustomerRegisgtration
        create session      mysession           ${base_url}
        ${body}=        create dictionary    firstName=him      lastName=kkk       userName=ssss        password=asdad      email=asdad
        ${header}=      create dictionary    Content-Type=application/json
        ${response}=    post request        mysession           /api/v1/register        headers=${header}        data=${body}

        log to console    ${response.content}

        #${innerContent}=    get from dictionary    ${response.content}      result

        ${innerContentDict}=     Evaluate    json.loads('${response.content.decode("utf-8")}')

        log to console    ${innerContentDict}
        ${neededContent}=   get from dictionary    ${innerContentDict}          result

        log to console    ${neededContent}

        ${absolutelyNeededContent}=     get from dictionary    ${neededContent}     somethingWentWrong

        log to console    ${absolutelyNeededContent}

        should be equal    ${absolutelyNeededContent}       shit u not


Put_CustomerRegisgtration_1
        create session      mysession           ${base_url}
        ${body}=        create dictionary    firstName=himo      lastName=kkk       userName=ssss        password=asdad      email=asdad
        ${header}=      create dictionary    Content-Type=application/json
        ${response}=    post request        mysession           /api/v1/register        headers=${header}        data=${body}

        log to console    ${response.content}

        #${innerContent}=    get from dictionary    ${response.content}      result

        ${innerContentDict}=     Evaluate    json.loads('${response.content.decode("utf-8")}')

        log to console    ${innerContentDict}
        ${neededContent}=   get from dictionary    ${innerContentDict}          result

        log to console    ${neededContent}

        ${absolutelyNeededContent}=     get from dictionary    ${neededContent}     goodRes

        log to console    ${absolutelyNeededContent}

        should be equal    ${absolutelyNeededContent}        good res



