*** Settings ***
Library     RequestsLibrary
Library     Collections

*** Variables ***
${base_url}     http://localhost:8080


*** Test Cases ***
TC1:Returns al the video games(GET)
    create session      mysesh      ${base_url}
      ${header}=      create dictionary    Accept=application/json
    ${response}=        get request    mysesh       /app/videogames     headers=${header}
    log to console    ${response.content}
    ${listy}=   convert to list    ${response.content}
    log to console    ${listy}


    ${innerContentDict}=     Evaluate    json.loads('${response.content.decode("utf-8")}')
    ${innerContentDictList}=        convert to list    ${innerContentDict}
    log to console    ${innerContentDictList}
    ${size}     get length    ${innerContentDictList}
    log to console    ${size}


    ${sixth_element}=      set variable    ${innerContentDictList[5]}
    log to console    ${sixth_element}


    ${gameName}=   get from dictionary    ${sixth_element}          name
    log to console    ${gameName}

    should be equal    ${gameName}      Doom

TC2:Add a new video game(POST)
    create session      mysesh          ${base_url}
    ${body}=     create dictionary      id=1002          name=spider         releaseData=2023-05-13T09:48:11.978Z        reviewScore=80      category=combat     rating=7
    ${header}=      create dictionary    Content-Type=application/json      Accept=application/json
    ${response}=     post request    mysesh          /app/videogames     data=${body}        headers=${header}
    log to console    ${response.content}


    ${status_code}=     convert to string    ${response.status_code}
    should be equal    ${status_code}       200

TC3:returns detail of single game
    create session      mysesh          ${base_url}
     ${header}=      create dictionary    Content-Type=application/json      Accept=application/json
    ${response}=        get request         mysesh          /app/videogames/1002      headers=${header}

    log to console    ${response.status_code}


    ${res_body}=        convert to string    ${response.content}
    ${innerContentDict}=     Evaluate    json.loads('${response.content.decode("utf-8")}')
    log to console    ${innerContentDict}
    log to console    ${res_body}

    ${neededContent}=   get from dictionary    ${innerContentDict}          name
    log to console    ${neededContent}
    should be equal    ${neededContent}         spider

TC4:update an existing game
    create session    mysesh        ${base_url}
    ${body}=     create dictionary      id=1002          name=rat         releaseData=2023-05-13T09:48:11.978Z        reviewScore=80      category=combat     rating=7
    ${header}=      create dictionary    Content-Type=application/json      Accept=application/json
    ${response}=     put request    mysesh          /app/videogames/1002     data=${body}        headers=${header}

    ${innerContentDict}=     Evaluate    json.loads('${response.content.decode("utf-8")}')

    log to console    ${innerContentDict}

    ${neededContent}=   get from dictionary    ${innerContentDict}          name
    should be equal     ${neededContent}        rat


TC5:Deletes video game

    create session      mysesh          ${base_url}
    ${response}=        delete request     mysesh     /app/videogames/1002

    ${status_code}=     convert to string    ${response.status_code}
    should be equal    ${status_code}       200


    ${res}=     convert to string    ${response.content}
    should contain      ${res}     Record Deleted Successfully





