Feature: As a user, I want to see an unsuccessful call to the TransactionFee API So that I can verify that the functionality is as expected

  Scenario: 1 - Verify the transaction fee api call is unsucessful when NICN is NULL
    When I call Transaction Fee API with the following data
      | Merchant  | NICN | Amount | Region           | Processor   |
      | Coastline | null |    100 | Chargeable state | Paysafe7861 |
    Then Verify the response is as follows
      | HttpStatusCode | TransactionFee | Fee | Message                                                                                                 |
      |            201 |            0.0 | 0.0 | surcharge was not applied (code-412) provide either (nicn and id) or (nicn, amt, region, optional(ids)) |

  Scenario: 2 - Verify the transaction fee api call is unsucessful when NICN is EMPTY
    When I call Transaction Fee API with the following data
      | Merchant  | NICN  | Amount | Region           | Processor   |
      | Coastline | empty |    100 | Chargeable state | Paysafe7861 |
    Then Verify the response is as follows
      | HttpStatusCode | TransactionFee | Fee | Message                                                                                                 |
      |            201 |            0.0 | 0.0 | surcharge was not applied (code-412) provide either (nicn and id) or (nicn, amt, region, optional(ids)) |

  Scenario: 3 - Verify the transaction fee api call is unsucessful when NICN is just a SPACE
    When I call Transaction Fee API with the following data
      | Merchant  | NICN    | Amount | Region           | Processor   |
      | Coastline | %space% |    100 | Chargeable state | Paysafe7861 |
    Then Verify the response is as follows
      | HttpStatusCode | TransactionFee | Fee | Message                                                                                                 |
      |            201 |            0.0 | 0.0 | surcharge was not applied (code-412) provide either (nicn and id) or (nicn, amt, region, optional(ids)) |

  Scenario: 4 - Verify the transaction fee api call is unsucessful when NICN is SKIP
    When I call Transaction Fee API with the following data
      | Merchant  | NICN | Amount | Region           | Processor   |
      | Coastline | skip |    100 | Chargeable state | Paysafe7861 |
    Then Verify the response is as follows
      | HttpStatusCode | TransactionFee | Fee | Message                                                                                                 |
      |            201 |            0.0 | 0.0 | surcharge was not applied (code-412) provide either (nicn and id) or (nicn, amt, region, optional(ids)) |

  Scenario: 5 - Verify the transaction fee api call is unsucessful when NICN is invalid
    When I call Transaction Fee API with the following data
      | Merchant  | NICN   | Amount | Region           | Processor   |
      | Coastline | 980765 |    100 | Chargeable state | Paysafe7861 |
    Then Verify the response is as follows
      | HttpStatusCode | TransactionFee | Fee | Sid     | Message            |
      |            201 |            0.0 | 0.0 | NotNull | no nicn (neutrino) |

  Scenario: 6 - Verify the transaction fee api call is unsucessful when NICN is 16 digit (including the last four digits of a credit card)
    When I call Transaction Fee API with the following data
      | Merchant  | NICN             | Amount | Region           | Processor   |
      | Coastline | 4010100000114567 |    100 | Chargeable state | Paysafe7861 |
    Then Verify the response is as follows
      | HttpStatusCode | TransactionFee | Fee | Sid     | Message            |
      |            201 |            0.0 | 0.0 | NotNull | no nicn (neutrino) |

  Scenario: 7 - Verify the transaction fee api call is unsucessful when AMOUNT is NULL
    When I call Transaction Fee API with the following data
      | Merchant  | NICN          | Amount | Region           | Processor   |
      | Coastline | VisaCorporate | null   | Chargeable state | Paysafe7861 |
    Then Verify the response is as follows
      | HttpStatusCode | TransactionFee | Fee | Message                                                                                                 |
      |            201 |            0.0 | 0.0 | surcharge was not applied (code-412) provide either (nicn and id) or (nicn, amt, region, optional(ids)) |

  Scenario: 10 - Verify the transaction fee api call is unsucessful when AMOUNT is SKIP
    When I call Transaction Fee API with the following data
      | Merchant  | NICN          | Amount | Region           | Processor   |
      | Coastline | VisaCorporate | skip   | Chargeable state | Paysafe7861 |
    Then Verify the response is as follows
      | HttpStatusCode | TransactionFee | Fee | Message                                                                                                 |
      |            201 |            0.0 | 0.0 | surcharge was not applied (code-412) provide either (nicn and id) or (nicn, amt, region, optional(ids)) |

  Scenario: 11 - Verify the transaction fee api call is unsucessful when AMOUNT is an alpha-numeric start and end with a number digit
    When I call Transaction Fee API with the following data
      | Merchant  | NICN          | Amount | Region           | Processor   |
      | Coastline | VisaCorporate | 1.0y34 | Chargeable state | Paysafe7861 |
    Then Verify the response is as follows
      | HttpStatusCode | TransactionFee | Fee | Sid     | Message            |
      |            201 |            0.0 | 0.0 | NotNull | no nicn (neutrino) |

  Scenario: 12 - Verify the transaction fee api call is unsucessful when AMOUNT is an alpha-numeric start with a letter
    When I call Transaction Fee API with the following data
      | Merchant  | NICN          | Amount | Region           | Processor   |
      | Coastline | VisaCorporate | y456   | Chargeable state | Paysafe7861 |
    Then Verify the response is as follows
      | HttpStatusCode | TransactionFee | Fee | Sid     | Message            |
      |            201 |            0.0 | 0.0 | NotNull | no nicn (neutrino) |

  Scenario: 13 - Verify the transaction fee api call is unsucessful when REGION is NULL
    When I call Transaction Fee API with the following data
      | Merchant  | NICN          | Amount | Region | Processor   |
      | Coastline | VisaCorporate |    100 | null   | Paysafe7861 |
    Then Verify the response is as follows
      | HttpStatusCode | TransactionFee | Fee | Message                                                                                                 |
      |            201 |            0.0 | 0.0 | surcharge was not applied (code-412) provide either (nicn and id) or (nicn, amt, region, optional(ids)) |

  Scenario: 14 - Verify the transaction fee api call is unsucessful when REGION is EMPTY
    When I call Transaction Fee API with the following data
      | Merchant  | NICN          | Amount | Region | Processor   |
      | Coastline | VisaCorporate |    100 | empty  | Paysafe7861 |
    Then Verify the response is as follows
      | HttpStatusCode | TransactionFee | Fee | Message                                                                                                 |
      |            201 |            0.0 | 0.0 | surcharge was not applied (code-412) provide either (nicn and id) or (nicn, amt, region, optional(ids)) |

  Scenario: 15 - Verify the transaction fee api call is unsucessful when REGION is just a SPACE
    When I call Transaction Fee API with the following data
      | Merchant  | NICN          | Amount | Region  | Processor   |
      | Coastline | VisaCorporate |    100 | %space% | Paysafe7861 |
    Then Verify the response is as follows
      | HttpStatusCode | TransactionFee | Fee | Message                                                                                                 |
      |            201 |            0.0 | 0.0 | surcharge was not applied (code-412) provide either (nicn and id) or (nicn, amt, region, optional(ids)) |

  Scenario: 16 - Verify the transaction fee api call is unsucessful when REGION is SKIP
    When I call Transaction Fee API with the following data
      | Merchant  | NICN          | Amount | Region | Processor   |
      | Coastline | VisaCorporate |    100 | skip   | Paysafe7861 |
    Then Verify the response is as follows
      | HttpStatusCode | TransactionFee | Fee | Message                                                                                                 |
      |            201 |            0.0 | 0.0 | surcharge was not applied (code-412) provide either (nicn and id) or (nicn, amt, region, optional(ids)) |

  Scenario: 17 - Verify the transaction fee api call is unsucessful when REGION is Alpha-numeric with special characters starting with a number
    When I call Transaction Fee API with the following data
      | Merchant  | NICN          | Amount | Region | Processor   |
      | Coastline | VisaCorporate |    100 | 1g@3_  | Paysafe7861 |
    Then Verify the response is as follows
      | HttpStatusCode | TransactionFee | Fee | Sid     | Message            |
      |            201 |            0.0 | 0.0 | NotNull | no nicn (neutrino) |

  Scenario: 18 - Verify the transaction fee api call is unsucessful when REGION is Alpha-numeric with special characters starting with a letter
    When I call Transaction Fee API with the following data
      | Merchant  | NICN          | Amount | Region | Processor   |
      | Coastline | VisaCorporate |    100 | g@3_a  | Paysafe7861 |
    Then Verify the response is as follows
      | HttpStatusCode | TransactionFee | Fee | Sid     | Message            |
      |            201 |            0.0 | 0.0 | NotNull | no nicn (neutrino) |

  Scenario: 19 - Verify the transaction fee api call is unsucessful when REGION is an invalid zipcode
    When I call Transaction Fee API with the following data
      | Merchant  | NICN          | Amount | Region | Processor   |
      | Coastline | VisaCorporate |    100 |  00000 | Paysafe7861 |
    Then Verify the response is as follows
      | HttpStatusCode | TransactionFee | Fee | Sid     | Message            |
      |            201 |            0.0 | 0.0 | NotNull | no nicn (neutrino) |

  Scenario: 20 - Verify the transaction fee api call is unsucessful when REGION is a valid non-US zipcode
    When I call Transaction Fee API with the following data
      | Merchant  | NICN          | Amount | Region | Processor   |
      | Coastline | VisaCorporate |    100 |  00801 | Paysafe7861 |
    Then Verify the response is as follows
      | HttpStatusCode | TransactionFee | Fee | Sid     | Message            |
      |            201 |            0.0 | 0.0 | NotNull | no nicn (neutrino) |

  Scenario: 21 - Verify the transaction fee api call is unsucessful when REGION is 1-2 digits
    When I call Transaction Fee API with the following data
      | Merchant  | NICN          | Amount | Region | Processor   |
      | Coastline | VisaCorporate |    100 |     01 | Paysafe7861 |
    Then Verify the response is as follows
      | HttpStatusCode | TransactionFee | Fee | Sid     | Message            |
      |            201 |            0.0 | 0.0 | NotNull | no nicn (neutrino) |

  Scenario: 22 - Verify the transaction fee api call is unsucessful when REGION is 6-8 digits
    When I call Transaction Fee API with the following data
      | Merchant  | NICN          | Amount | Region  | Processor   |
      | Coastline | VisaCorporate |    100 | 0100909 | Paysafe7861 |
    Then Verify the response is as follows
      | HttpStatusCode | TransactionFee | Fee | Sid     | Message            |
      |            201 |            0.0 | 0.0 | NotNull | no nicn (neutrino) |

  Scenario: 23 - Verify the transaction fee api call is unsucessful when PROCESSOR is NULL
    When I call Transaction Fee API with the following data
      | Merchant  | NICN          | Amount | Region           | Processor |
      | Coastline | VisaCorporate |    100 | Chargeable state | null      |
    Then Verify the response is as follows
      | HttpStatusCode | TransactionFee | Fee | Sid     | Message                                               |
      |            201 |            0.0 | 0.0 | NotNull | no processor passed-in and more than one is available |

  Scenario: 24 - Verify the transaction fee api call is unsucessful when PROCESSOR is EMPTY
    When I call Transaction Fee API with the following data
      | Merchant  | NICN          | Amount | Region           | Processor |
      | Coastline | VisaCorporate |    100 | Chargeable state | empty     |
    Then Verify the response is as follows
      | HttpStatusCode | TransactionFee | Fee | Sid     | Message                                               |
      |            201 |            0.0 | 0.0 | NotNull | no processor passed-in and more than one is available |

  Scenario: 25 - Verify the transaction fee api call is unsucessful when PROCESSOR is just a SPACE
    When I call Transaction Fee API with the following data
      | Merchant  | NICN          | Amount | Region           | Processor |
      | Coastline | VisaCorporate |    100 | Chargeable state | %space%   |
    Then Verify the response is as follows
      | HttpStatusCode | TransactionFee | Fee | Sid     | Message                                               |
      |            201 |            0.0 | 0.0 | NotNull | no processor passed-in and more than one is available |

  Scenario: 26 - Verify the transaction fee api call is unsucessful when PROCESSOR is SKIP
    When I call Transaction Fee API with the following data
      | Merchant  | NICN          | Amount | Region           | Processor |
      | Coastline | VisaCorporate |    100 | Chargeable state | skip      |
    Then Verify the response is as follows
      | HttpStatusCode | TransactionFee | Fee | Sid     | Message                                               |
      |            201 |            0.0 | 0.0 | NotNull | no processor passed-in and more than one is available |

  Scenario: 27 - Verify the transaction fee api call is unsucessful when PROCESSOR is Invalid
    When I call Transaction Fee API with the following data
      | Merchant  | NICN          | Amount | Region           | Processor |
      | Coastline | VisaCorporate |    100 | Chargeable state | invalid   |
    Then Verify the response is as follows
      | HttpStatusCode | TransactionFee | Fee | Sid     | Message            |
      |            201 |            0.0 | 0.0 | NotNull | no nicn (neutrino) |
