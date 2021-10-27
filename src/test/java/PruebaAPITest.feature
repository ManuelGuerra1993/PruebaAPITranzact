@Todo
Feature: Pruebas de country api

  @Tranzact @todo
  Scenario: prueba1
    Given url 'http://api.countrylayer.com/v2/'
    And form field access_key = 'ff392b918f120144da4b8b0c8c1e0852'
    And path 'all'
    When method GET
    Then status 200
    And print response


  @Tranzact2 @todo
  Scenario Outline: prueba2
    Given url 'http://api.countrylayer.com/v2/alpha/'
    And form field access_key = 'ff392b918f120144da4b8b0c8c1e0852'
    And path '<code>'
    When method GET
    And print response
    * match response == {"name":"<name>","topLevelDomain":["<level>"],"alpha2Code":"<code>","alpha3Code":"<alpha3>","callingCodes":["<call>"],"capital":"<capital>","altSpellings":["<code>","<spell2>","<spell3>"],"region":"<region>"}
    Then status 200


    Examples:
      | code | name                                                 | level | alpha3 | call | capital          | spell2                      | spell3                     | region   |
      | US   | United States of America                             | .us   | USA    | 1    | Washington, D.C. | USA                         | United States of America   | Americas |
      | DE   | Germany                                              | .de   | DEU    | 49   | Berlin           | Federal Republic of Germany | Bundesrepublik Deutschland | Europe   |
      | GB   | United Kingdom of Great Britain and Northern Ireland | .uk   | GBR    | 44   | London           | UK                          | Great Britain              | Europe   |


  @Tranzact3 @todo
  Scenario Outline: prueba3
    Given url 'http://api.countrylayer.com/v2/alpha/'
    And form field access_key = 'ff392b918f120144da4b8b0c8c1e0852'
    And path '<code>'
    When method GET
    And print response
    * match response == {"status":<status>,"message":"<message>"}
    Then status <status>

    Examples:
      | code | status | message   |
      | M1   | 404    | Not Found |


  @Tranzact4 @todo
  Scenario Outline: Registrar Pais
    Given url 'http://api.countrylayer.com/v2/alpha'
    And request {"nombre": "<name>", "alpha2_code": "<code2>", "alpha3_code": "<code3>"}
    When method post
    Then status 200
    * match response == {"nombre": "<name>", "alpha2_code": "<code2>", "alpha3_code": "<code3>"}

    Examples:
      | name           | code2 | code3 |
      | País de prueba | TC    | TCY   |