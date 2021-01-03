Feature: As a user, I want to make call to get responce

  Scenario: 1 -A call to Transaction Fee API when NICN is NULL
    When I call Transaction Fee API with the following data
      | Merchant  | NICN | Amount | Region | Processor |
      | Coastline | null |    100 |  11801 | SurchX    |
    Then Get the response

  Scenario: 2 -A call to Transaction Fee API when NICN is EMPTY
    When I call Transaction Fee API with the following data
      | Merchant  | NICN | Amount | Region | Processor |
      | Coastline | empty |    100 |  11801 | SurchX    |
    Then Get the response

  Scenario: 3 -A call to Transaction Fee API when NICN is just a SPACE
    When I call Transaction Fee API with the following data
      | Merchant  | NICN | Amount | Region | Processor |
      | Coastline | %space% |    100 |  11801 | SurchX    |
    Then Get the response

  Scenario: 4 -A call to Transaction Fee API when NICN is SKIP
    When I call Transaction Fee API with the following data
      | Merchant  | NICN | Amount | Region | Processor |
      | Coastline | skip |    100 |  11801 | SurchX    |
    Then Get the response

  Scenario: 5 -A call to Transaction Fee API when NICN is invalid
    When I call Transaction Fee API with the following data
      | Merchant  | NICN | Amount | Region | Processor |
      | Coastline | 980765 |    100 |  11801 | SurchX    |
    Then Get the response

  Scenario: 6 -A call to Transaction Fee API when NICN is 16 digit (including the last four digits of a credit card)
    When I call Transaction Fee API with the following data
      | Merchant  | NICN             | Amount | Region | Processor |
      | Coastline | 4010100000114567 |    100 |  11801 | SurchX    |
    Then Get the response

  Scenario: 7 -A call to Transaction Fee API when AMOUNT is sent in as a string and the value is NULL
    When I call Transaction Fee API with the following data
      | Merchant  | NICN          | Amount | Region | Processor |
      | Coastline | VisaCorporate |   null |  11801 | SurchX    |
    Then Get the response

  Scenario: 8 -A call to Transaction Fee API when AMOUNT is SKIP
    When I call Transaction Fee API with the following data
      | Merchant  | NICN | Amount | Region | Processor |
      | Coastline | VisaCorporate |   skip |  11801 | SurchX    |
    Then Get the response

  Scenario: 9 -A call to Transaction Fee API when AMOUNT is sent in as a string and the value is an alpha-numeric start and end with a number digit
    When I call Transaction Fee API with the following data
      | Merchant  | NICN | Amount | Region | Processor |
      | Coastline | VisaCorporate |   1S@0 |  11801 | SurchX    |
    Then Get the response

  Scenario: 10 -A call to Transaction Fee API when  AMOUNT is sent in as a string and the value is an alpha-numeric start with a letter
    When I call Transaction Fee API with the following data
      | Merchant  | NICN | Amount | Region | Processor |
      | Coastline | VisaCorporate |   A^00 |  11801 | SurchX    |
    Then Get the response

  Scenario: 11 -A call to Transaction Fee API when  AMOUNT is sent in as a string and the value is a space
    When I call Transaction Fee API with the following data
      | Merchant  | NICN          | Amount | Region | Processor |
      | Coastline | VisaCorporate | %space%|  11801 | SurchX    |
    Then Get the response

  Scenario: 12 -A call to Transaction Fee API when  AMOUNT is sent in as a string and the value is a empty
    When I call Transaction Fee API with the following data
      | Merchant  | NICN          | Amount | Region | Processor |
      | Coastline | VisaCorporate | empty  |  11801 | SurchX    |
    Then Get the response

  Scenario: 13 -A call to Transaction Fee API when  AMOUNT is ZERO
    When I call Transaction Fee API with the following data
      | Merchant  | NICN          | Amount | Region | Processor |
      | Coastline | VisaCorporate |   0    |  11801 | SurchX    |
    Then Get the response

  Scenario: 14 -A call to Transaction Fee API when REGION is NULL
    When I call Transaction Fee API with the following data
      | Merchant  | NICN          | Amount | Region | Processor |
      | Coastline | VisaCorporate |   100  |  null | SurchX    |
    Then Get the response

  Scenario: 15 -A call to Transaction Fee API when REGION is EMPTY
    When I call Transaction Fee API with the following data
      | Merchant  | NICN          | Amount | Region | Processor |
      | Coastline | VisaCorporate |   100  |  empty | SurchX    |
    Then Get the response

  Scenario: 16 -A call to Transaction Fee API when REGION is just a SPACE
    When I call Transaction Fee API with the following data
      | Merchant  | NICN          | Amount | Region  | Processor |
      | Coastline | VisaCorporate |   100  | %space% | SurchX    |
    Then Get the response

  Scenario: 17 -A call to Transaction Fee API when REGION is SKIP
    When I call Transaction Fee API with the following data
      | Merchant  | NICN          | Amount | Region | Processor |
      | Coastline | VisaCorporate |   100  |  skip | SurchX    |
    Then Get the response

  Scenario: 18 -A call to Transaction Fee API when REGION is Alpha-numeric with special characters starting with a number
    When I call Transaction Fee API with the following data
      | Merchant  | NICN          | Amount | Region | Processor |
      | Coastline | VisaCorporate |   100  |  1a@2_ | SurchX    |
    Then Get the response

  Scenario: 19 -A call to Transaction Fee API when REGION is Alpha-numeric with special characters starting with a letter
    When I call Transaction Fee API with the following data
      | Merchant  | NICN          | Amount | Region | Processor |
      | Coastline | VisaCorporate |   100  |  a@3_p | SurchX    |
    Then Get the response

  Scenario: 20 -A call to Transaction Fee API when REGION is an invalid zipcode
    When I call Transaction Fee API with the following data
      | Merchant  | NICN          | Amount | Region | Processor |
      | Coastline | VisaCorporate |   100  |  00000 | SurchX    |
    Then Get the response

  Scenario: 21 -A call to Transaction Fee API when REGION is a valid non-US zipcode
    When I call Transaction Fee API with the following data
      | Merchant  | NICN          | Amount | Region | Processor |
      | Coastline | VisaCorporate |   100  |  00801 | SurchX    |
    Then Get the response

  Scenario: 22 -A call to Transaction Fee API when REGION is 1-2 digits
    When I call Transaction Fee API with the following data
      | Merchant  | NICN          | Amount | Region | Processor |
      | Coastline | VisaCorporate |   100  |  11    | SurchX    |
    Then Get the response

  Scenario: 23 -A call to Transaction Fee API when REGION is 6-8 digits
    When I call Transaction Fee API with the following data
      | Merchant  | NICN          | Amount | Region | Processor |
      | Coastline | VisaCorporate |   100  | 010045 | SurchX    |
    Then Get the response

  Scenario: 24 -A call to Transaction Fee API when PROCESSOR is NULL
      | Merchant  | NICN          | Amount | Region | Processor |
      | Coastline | VisaCorporate |   100  |  11801 | null    |
    Then Get the response

  Scenario: 25 -A call to Transaction Fee API when PROCESSOR is EMPTY
    When I call Transaction Fee API with the following data
      | Merchant  | NICN          | Amount | Region | Processor |
      | Coastline | VisaCorporate |   100  |  11801 | empty    |
    Then Get the response

  Scenario: 26 -A call to Transaction Fee API when PROCESSOR is just a SPACE
    When I call Transaction Fee API with the following data
      | Merchant  | NICN          | Amount | Region | Processor |
      | Coastline | VisaCorporate |   100  |  11801 | %space%   |
    Then Get the response

  Scenario: 27 -A call to Transaction Fee API when PROCESSOR is SKIP
    When I call Transaction Fee API with the following data
      | Merchant  | NICN          | Amount | Region | Processor |
      | Coastline | VisaCorporate |   100  |  11801 | skip      |
    Then Get the response
