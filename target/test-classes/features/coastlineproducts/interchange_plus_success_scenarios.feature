Feature: As a user, I want to see a successful call to the TransactionFee API So that I can verify the interchange plus calculations are being calculated in a right way.

  Scenario Outline: 1 - Verify Transaction Fee API call with different types of VISA cards with Paysafe7861 processor
    When I call Transaction Fee API with the following data
      | Merchant  | NICN   | Amount   | Region   | Processor   |
      | Coastline | <NICN> | <Amount> | <Region> | <Processor> |
    Then Verify the response is as follows
      | HttpStatusCode   | TransactionFee   | Sid   | Message   |
      | <HttpStatusCode> | <TransactionFee> | <Sid> | <Message> |

    Examples: 
      | NICN                   | Amount | Region               | Processor   | HttpStatusCode | TransactionFee                                                 | Sid     | Message |
      | VisaTraditionalRewards | 108.00 | Chargeable state     | Paysafe7861 |            201 | Interchange:FixedFee:GatewayMarkup:NetworkFee:SurchxPercentage | NotNull | ok      |
      | VisaNonRewards         | 108.00 | Chargeable state     | Paysafe7861 |            201 | Interchange:FixedFee:GatewayMarkup:NetworkFee:SurchxPercentage | NotNull | ok      |
      | VisaSignature          | 108.00 | Chargeable state     | Paysafe7861 |            201 | Interchange:FixedFee:GatewayMarkup:NetworkFee:SurchxPercentage | NotNull | ok      |
      | VisaSignaturePreferred | 108.00 | Chargeable state     | Paysafe7861 |            201 | Interchange:FixedFee:GatewayMarkup:NetworkFee:SurchxPercentage | NotNull | ok      |
      | VisaCorporate          | 108.00 | Chargeable state     | Paysafe7861 |            201 | Interchange:FixedFee:GatewayMarkup:NetworkFee:SurchxPercentage | NotNull | ok      |
      | VisaTraditionalRewards | 108.00 | Non-Chargeable state | Paysafe7861 |            201 |                                                           0.00 | NotNull | ok      |
      | VisaNonRewards         | 108.00 | Non-Chargeable state | Paysafe7861 |            201 |                                                           0.00 | NotNull | ok      |
      | VisaSignature          | 108.00 | Non-Chargeable state | Paysafe7861 |            201 |                                                           0.00 | NotNull | ok      |
      | VisaSignaturePreferred | 108.00 | Non-Chargeable state | Paysafe7861 |            201 |                                                           0.00 | NotNull | ok      |
      | VisaCorporate          | 108.00 | Non-Chargeable state | Paysafe7861 |            201 |                                                           0.00 | NotNull | ok      |

  Scenario Outline: 2 - Verify Transaction Fee API call with different types of VISA cards with Paysafe9909 processor
    When I call Transaction Fee API with the following data
      | Merchant  | NICN   | Amount   | Region   | Processor   |
      | Coastline | <NICN> | <Amount> | <Region> | <Processor> |
    Then Verify the response is as follows
      | HttpStatusCode   | TransactionFee   | Sid   | Message   |
      | <HttpStatusCode> | <TransactionFee> | <Sid> | <Message> |

    Examples: 
      | NICN                   | Amount | Region               | Processor   | HttpStatusCode | TransactionFee                                                 | Sid     | Message |
      | VisaTraditionalRewards | 108.00 | Chargeable state     | Paysafe9909 |            201 | Interchange:FixedFee:GatewayMarkup:NetworkFee:SurchxPercentage | NotNull | ok      |
      | VisaNonRewards         | 108.00 | Chargeable state     | Paysafe9909 |            201 | Interchange:FixedFee:GatewayMarkup:NetworkFee:SurchxPercentage | NotNull | ok      |
      | VisaSignature          | 108.00 | Chargeable state     | Paysafe9909 |            201 | Interchange:FixedFee:GatewayMarkup:NetworkFee:SurchxPercentage | NotNull | ok      |
      | VisaSignaturePreferred | 108.00 | Chargeable state     | Paysafe9909 |            201 | Interchange:FixedFee:GatewayMarkup:NetworkFee:SurchxPercentage | NotNull | ok      |
      | VisaCorporate          | 108.00 | Chargeable state     | Paysafe9909 |            201 | Interchange:FixedFee:GatewayMarkup:NetworkFee:SurchxPercentage | NotNull | ok      |
      | VisaTraditionalRewards | 108.00 | Non-Chargeable state | Paysafe9909 |            201 |                                                           0.00 | NotNull | ok      |
      | VisaNonRewards         | 108.00 | Non-Chargeable state | Paysafe9909 |            201 |                                                           0.00 | NotNull | ok      |
      | VisaSignature          | 108.00 | Non-Chargeable state | Paysafe9909 |            201 |                                                           0.00 | NotNull | ok      |
      | VisaSignaturePreferred | 108.00 | Non-Chargeable state | Paysafe9909 |            201 |                                                           0.00 | NotNull | ok      |
      | VisaCorporate          | 108.00 | Non-Chargeable state | Paysafe9909 |            201 |                                                           0.00 | NotNull | ok      |

  Scenario Outline: 3 - Verify Transaction Fee API call with different types of VISA cards with Titanium4994 processor
    When I call Transaction Fee API with the following data
      | Merchant  | NICN   | Amount   | Region   | Processor   |
      | Coastline | <NICN> | <Amount> | <Region> | <Processor> |
    Then Verify the response is as follows
      | HttpStatusCode   | TransactionFee   | Sid   | Message   |
      | <HttpStatusCode> | <TransactionFee> | <Sid> | <Message> |

    Examples: 
      | NICN                   | Amount | Region               | Processor    | HttpStatusCode | TransactionFee                                                 | Sid     | Message |
      | VisaTraditionalRewards | 108.00 | Chargeable state     | Titanium4994 |            201 | Interchange:FixedFee:GatewayMarkup:NetworkFee:SurchxPercentage | NotNull | ok      |
      | VisaNonRewards         | 108.00 | Chargeable state     | Titanium4994 |            201 | Interchange:FixedFee:GatewayMarkup:NetworkFee:SurchxPercentage | NotNull | ok      |
      | VisaSignature          | 108.00 | Chargeable state     | Titanium4994 |            201 | Interchange:FixedFee:GatewayMarkup:NetworkFee:SurchxPercentage | NotNull | ok      |
      | VisaSignaturePreferred | 108.00 | Chargeable state     | Titanium4994 |            201 | Interchange:FixedFee:GatewayMarkup:NetworkFee:SurchxPercentage | NotNull | ok      |
      | VisaCorporate          | 108.00 | Chargeable state     | Titanium4994 |            201 | Interchange:FixedFee:GatewayMarkup:NetworkFee:SurchxPercentage | NotNull | ok      |
      | VisaTraditionalRewards | 108.00 | Non-Chargeable state | Titanium4994 |            201 |                                                           0.00 | NotNull | ok      |
      | VisaNonRewards         | 108.00 | Non-Chargeable state | Titanium4994 |            201 |                                                           0.00 | NotNull | ok      |
      | VisaSignature          | 108.00 | Non-Chargeable state | Titanium4994 |            201 |                                                           0.00 | NotNull | ok      |
      | VisaSignaturePreferred | 108.00 | Non-Chargeable state | Titanium4994 |            201 |                                                           0.00 | NotNull | ok      |
      | VisaCorporate          | 108.00 | Non-Chargeable state | Titanium4994 |            201 |                                                           0.00 | NotNull | ok      |

  Scenario Outline: 4 - Verify Transaction Fee API call with different types of MASTERCARD with PAYSAFE7861 processor
    When I call Transaction Fee API with the following data
      | Merchant  | NICN   | Amount   | Region   | Processor   |
      | Coastline | <NICN> | <Amount> | <Region> | <Processor> |
    Then Verify the response is as follows
      | HttpStatusCode   | TransactionFee   | Sid   | Message   |
      | <HttpStatusCode> | <TransactionFee> | <Sid> | <Message> |

    Examples: 
      | NICN                         | Amount | Region               | Processor   | HttpStatusCode | TransactionFee                                                 | Sid     | Message |
      | MastercardCoreValue          | 108.00 | Chargeable state     | Paysafe7861 |            201 | Interchange:FixedFee:GatewayMarkup:NetworkFee:SurchxPercentage | NotNull | ok      |
      | MastercardWorld              | 108.00 | Chargeable state     | Paysafe7861 |            201 | Interchange:FixedFee:GatewayMarkup:NetworkFee:SurchxPercentage | NotNull | ok      |
      | MastercardBusinessCore       | 108.00 | Chargeable state     | Paysafe7861 |            201 | Interchange:FixedFee:GatewayMarkup:NetworkFee:SurchxPercentage | NotNull | ok      |
      | MastercardBusinessWorldElite | 108.00 | Chargeable state     | Paysafe7861 |            201 | Interchange:FixedFee:GatewayMarkup:NetworkFee:SurchxPercentage | NotNull | ok      |
      | MastercardCoreValue          | 108.00 | Non-Chargeable state | Paysafe7861 |            201 |                                                           0.00 | NotNull | ok      |
      | MastercardWorld              | 108.00 | Non-Chargeable state | Paysafe7861 |            201 |                                                           0.00 | NotNull | ok      |
      | MastercardBusinessCore       | 108.00 | Non-Chargeable state | Paysafe7861 |            201 |                                                           0.00 | NotNull | ok      |
      | MastercardBusinessWorldElite | 108.00 | Non-Chargeable state | Paysafe7861 |            201 |                                                           0.00 | NotNull | ok      |

  Scenario Outline: 5 - Verify Transaction Fee API call with different types of MASTERCARD with PAYSAFE9909 processor
    When I call Transaction Fee API with the following data
      | Merchant  | NICN   | Amount   | Region   | Processor   |
      | Coastline | <NICN> | <Amount> | <Region> | <Processor> |
    Then Verify the response is as follows
      | HttpStatusCode   | TransactionFee   | Sid   | Message   |
      | <HttpStatusCode> | <TransactionFee> | <Sid> | <Message> |

    Examples: 
      | NICN                         | Amount | Region               | Processor   | HttpStatusCode | TransactionFee                                                 | Sid     | Message |
      | MastercardCoreValue          | 108.00 | Chargeable state     | Paysafe9909 |            201 | Interchange:FixedFee:GatewayMarkup:NetworkFee:SurchxPercentage | NotNull | ok      |
      | MastercardWorld              | 108.00 | Chargeable state     | Paysafe9909 |            201 | Interchange:FixedFee:GatewayMarkup:NetworkFee:SurchxPercentage | NotNull | ok      |
      | MastercardBusinessCore       | 108.00 | Chargeable state     | Paysafe9909 |            201 | Interchange:FixedFee:GatewayMarkup:NetworkFee:SurchxPercentage | NotNull | ok      |
      | MastercardBusinessWorldElite | 108.00 | Chargeable state     | Paysafe9909 |            201 | Interchange:FixedFee:GatewayMarkup:NetworkFee:SurchxPercentage | NotNull | ok      |
      | MastercardCoreValue          | 108.00 | Non-Chargeable state | Paysafe9909 |            201 |                                                           0.00 | NotNull | ok      |
      | MastercardWorld              | 108.00 | Non-Chargeable state | Paysafe9909 |            201 |                                                           0.00 | NotNull | ok      |
      | MastercardBusinessCore       | 108.00 | Non-Chargeable state | Paysafe9909 |            201 |                                                           0.00 | NotNull | ok      |
      | MastercardBusinessWorldElite | 108.00 | Non-Chargeable state | Paysafe9909 |            201 |                                                           0.00 | NotNull | ok      |

  Scenario Outline: 6 - Verify Transaction Fee API call with different types of MASTERCARD with Titanium4994 processor
    When I call Transaction Fee API with the following data
      | Merchant  | NICN   | Amount   | Region   | Processor   |
      | Coastline | <NICN> | <Amount> | <Region> | <Processor> |
    Then Verify the response is as follows
      | HttpStatusCode   | TransactionFee   | Sid   | Message   |
      | <HttpStatusCode> | <TransactionFee> | <Sid> | <Message> |

    Examples: 
      | NICN                         | Amount | Region               | Processor    | HttpStatusCode | TransactionFee                                                 | Sid     | Message |
      | MastercardCoreValue          | 108.00 | Chargeable state     | Titanium4994 |            201 | Interchange:FixedFee:GatewayMarkup:NetworkFee:SurchxPercentage | NotNull | ok      |
      | MastercardWorld              | 108.00 | Chargeable state     | Titanium4994 |            201 | Interchange:FixedFee:GatewayMarkup:NetworkFee:SurchxPercentage | NotNull | ok      |
      | MastercardBusinessCore       | 108.00 | Chargeable state     | Titanium4994 |            201 | Interchange:FixedFee:GatewayMarkup:NetworkFee:SurchxPercentage | NotNull | ok      |
      | MastercardBusinessWorldElite | 108.00 | Chargeable state     | Titanium4994 |            201 | Interchange:FixedFee:GatewayMarkup:NetworkFee:SurchxPercentage | NotNull | ok      |
      | MastercardCoreValue          | 108.00 | Non-Chargeable state | Titanium4994 |            201 |                                                           0.00 | NotNull | ok      |
      | MastercardWorld              | 108.00 | Non-Chargeable state | Titanium4994 |            201 |                                                           0.00 | NotNull | ok      |
      | MastercardBusinessCore       | 108.00 | Non-Chargeable state | Titanium4994 |            201 |                                                           0.00 | NotNull | ok      |
      | MastercardBusinessWorldElite | 108.00 | Non-Chargeable state | Titanium4994 |            201 |                                                           0.00 | NotNull | ok      |

  Scenario Outline: 7 - Verify Transaction Fee API call with different types of DISCOVER with PAYSAFE7861 processor
    When I call Transaction Fee API with the following data
      | Merchant  | NICN   | Amount   | Region   | Processor   |
      | Coastline | <NICN> | <Amount> | <Region> | <Processor> |
    Then Verify the response is as follows
      | HttpStatusCode   | TransactionFee   | Fee   | Sid   | Message   |
      | <HttpStatusCode> | <TransactionFee> | <Fee> | <Sid> | <Message> |

    Examples: 
      | NICN            | Amount | Region               | Processor   | HttpStatusCode | TransactionFee                                                 | Sid     | Message |
      | DiscoverCore    | 108.00 | Chargeable state     | Paysafe7861 |            201 | Interchange:FixedFee:GatewayMarkup:NetworkFee:SurchxPercentage | NotNull | ok      |
      | DiscoverRewards | 108.00 | Chargeable state     | Paysafe7861 |            201 | Interchange:FixedFee:GatewayMarkup:NetworkFee:SurchxPercentage | NotNull | ok      |
      | DiscoverCore    | 108.00 | Non-Chargeable state | Paysafe7861 |            201 |                                                           0.00 | NotNull | ok      |
      | DiscoverRewards | 108.00 | Non-Chargeable state | Paysafe7861 |            201 |                                                           0.00 | NotNull | ok      |

  Scenario Outline: 8 - Verify Transaction Fee API call with different types of DISCOVER with PAYSAFE9909 processor
    When I call Transaction Fee API with the following data
      | Merchant  | NICN   | Amount   | Region   | Processor   |
      | Coastline | <NICN> | <Amount> | <Region> | <Processor> |
    Then Verify the response is as follows
      | HttpStatusCode   | TransactionFee   | Sid   | Message   |
      | <HttpStatusCode> | <TransactionFee> | <Sid> | <Message> |

    Examples: 
      | NICN            | Amount | Region               | Processor   | HttpStatusCode | TransactionFee                                                 | Sid     | Message |
      | DiscoverCore    | 108.00 | Chargeable state     | Paysafe9909 |            201 | Interchange:FixedFee:GatewayMarkup:NetworkFee:SurchxPercentage | NotNull | ok      |
      | DiscoverRewards | 108.00 | Chargeable state     | Paysafe9909 |            201 | Interchange:FixedFee:GatewayMarkup:NetworkFee:SurchxPercentage | NotNull | ok      |
      | DiscoverCore    | 108.00 | Non-Chargeable state | Paysafe9909 |            201 |                                                           0.00 | NotNull | ok      |
      | DiscoverRewards | 108.00 | Non-Chargeable state | Paysafe9909 |            201 |                                                           0.00 | NotNull | ok      |

  Scenario Outline: 9 - Verify Transaction Fee API call with different types of DISCOVER with Titanium4994 processor
    When I call Transaction Fee API with the following data
      | Merchant  | NICN   | Amount   | Region   | Processor   |
      | Coastline | <NICN> | <Amount> | <Region> | <Processor> |
    Then Verify the response is as follows
      | HttpStatusCode   | TransactionFee   | Sid   | Message   |
      | <HttpStatusCode> | <TransactionFee> | <Sid> | <Message> |

    Examples: 
      | NICN            | Amount | Region               | Processor    | HttpStatusCode | TransactionFee                                                 | Sid     | Message |
      | DiscoverCore    | 108.00 | Chargeable state     | Titanium4994 |            201 | Interchange:FixedFee:GatewayMarkup:NetworkFee:SurchxPercentage | NotNull | ok      |
      | DiscoverRewards | 108.00 | Chargeable state     | Titanium4994 |            201 | Interchange:FixedFee:GatewayMarkup:NetworkFee:SurchxPercentage | NotNull | ok      |
      | DiscoverCore    | 108.00 | Non-Chargeable state | Titanium4994 |            201 |                                                           0.00 | NotNull | ok      |
      | DiscoverRewards | 108.00 | Non-Chargeable state | Titanium4994 |            201 |                                                           0.00 | NotNull | ok      |

  Scenario Outline: 10 - Verify Transaction Fee API call with different types of AMEX with PAYSAFE7861 processor
    When I call Transaction Fee API with the following data
      | Merchant  | NICN   | Amount   | Region   | Processor   |
      | Coastline | <NICN> | <Amount> | <Region> | <Processor> |
    Then Verify the response is as follows
      | HttpStatusCode   | TransactionFee   | Fee   | Sid   | Message   |
      | <HttpStatusCode> | <TransactionFee> | <Fee> | <Sid> | <Message> |

    Examples: 
      | NICN         | Amount | Region               | Processor   | HttpStatusCode | TransactionFee                                                 | Sid     | Message |
      | AmexStandard |  80.00 | Chargeable state     | Paysafe7861 |            201 | Interchange:FixedFee:GatewayMarkup:NetworkFee:SurchxPercentage | NotNull | ok      |
      | AmexStandard |  80.00 | Non-Chargeable state | Paysafe7861 |            201 |                                                           0.00 | NotNull | ok      |

  Scenario Outline: 11 - Verify Transaction Fee API call with different types of AMEX with PAYSAFE9909 processor
    When I call Transaction Fee API with the following data
      | Merchant  | NICN   | Amount   | Region   | Processor   |
      | Coastline | <NICN> | <Amount> | <Region> | <Processor> |
    Then Verify the response is as follows
      | HttpStatusCode   | TransactionFee   | Sid   | Message   |
      | <HttpStatusCode> | <TransactionFee> | <Sid> | <Message> |

    Examples: 
      | NICN         | Amount | Region               | Processor   | HttpStatusCode | TransactionFee                                                 | Sid     | Message |
      | AmexStandard |  80.00 | Chargeable state     | Paysafe9909 |            201 | Interchange:FixedFee:GatewayMarkup:NetworkFee:SurchxPercentage | NotNull | ok      |
      | AmexStandard |  80.00 | Non-Chargeable state | Paysafe9909 |            201 |                                                           0.00 | NotNull | ok      |

  Scenario Outline: 12 - Verify Transaction Fee API call with different types of AMEX with Titanium4994 processor
    When I call Transaction Fee API with the following data
      | Merchant  | NICN   | Amount   | Region   | Processor   |
      | Coastline | <NICN> | <Amount> | <Region> | <Processor> |
    Then Verify the response is as follows
      | HttpStatusCode   | TransactionFee   | Fee   | Sid   | Message   |
      | <HttpStatusCode> | <TransactionFee> | <Fee> | <Sid> | <Message> |

    Examples: 
      | NICN         | Amount | Region               | Processor    | HttpStatusCode | TransactionFee                                                 | Sid     | Message |
      | AmexStandard |  80.00 | Chargeable state     | Titanium4994 |            201 | Interchange:FixedFee:GatewayMarkup:NetworkFee:SurchxPercentage | NotNull | ok      |
      | AmexStandard |  80.00 | Non-Chargeable state | Titanium4994 |            201 |                                                           0.00 | NotNull | ok      |

  Scenario Outline: 13 - Verify Surchx Fee and transaction fee with different combinations of data
    When I call Transaction Fee API with the following data
      | Merchant  | NICN   | Amount   | Region   | Processor   |
      | Coastline | <NICN> | <Amount> | <Region> | <Processor> |
    Then Verify the response is as follows
      | HttpStatusCode   | TransactionFee   | Fee   | Sid   | Message   |
      | <HttpStatusCode> | <TransactionFee> | <Fee> | <Sid> | <Message> |

    Examples: 
      | NICN                   | Amount  | Region           | Processor    | HttpStatusCode | TransactionFee                                                 | Sid     | Message |
      | MastercardCoreValue    |   49.99 | Chargeable state | Titanium4994 |            201 | Interchange:FixedFee:GatewayMarkup:NetworkFee:SurchxPercentage | NotNull | ok      |
      | VisaCorporate          |   50.00 | Chargeable state | Paysafe7861  |            201 | Interchange:FixedFee:GatewayMarkup:NetworkFee:SurchxPercentage | NotNull | ok      |
      | DiscoverRewards        |   20.00 | Chargeable state | Titanium4994 |            201 | Interchange:FixedFee:GatewayMarkup:NetworkFee:SurchxPercentage | NotNull | ok      |
      | MastercardBusinessCore |    5.00 | Chargeable state | Paysafe9909  |            201 | Interchange:FixedFee:GatewayMarkup:NetworkFee:SurchxPercentage | NotNull | ok      |
      | VisaSignaturePreferred |  400.00 | Chargeable state | Paysafe7861  |            201 | Interchange:FixedFee:GatewayMarkup:NetworkFee:SurchxPercentage | NotNull | ok      |
      | AmexStandard           |    2.99 | Chargeable state | Paysafe9909  |            201 | Interchange:FixedFee:GatewayMarkup:NetworkFee:SurchxPercentage | NotNull | ok      |
      | VisaTraditionalRewards |    7.67 | Chargeable state | Paysafe7861  |            201 | Interchange:FixedFee:GatewayMarkup:NetworkFee:SurchxPercentage | NotNull | ok      |
      | MastercardWorld        |  253.97 | Chargeable state | Paysafe7861  |            201 | Interchange:FixedFee:GatewayMarkup:NetworkFee:SurchxPercentage | NotNull | ok      |
      | VisaNonRewards         | 1000.99 | Chargeable state | Titanium4994 |            201 | Interchange:FixedFee:GatewayMarkup:NetworkFee:SurchxPercentage | NotNull | ok      |

  Scenario Outline: 14 - Verify Surchx Fee and transaction fee with Virgin Island zip code and differnt types of cards (country code and region mismatch)
    When I call Transaction Fee API with the following data
      | Merchant  | NICN   | Amount   | Region   | Processor   |
      | Coastline | <NICN> | <Amount> | <Region> | <Processor> |
    Then Verify the response is as follows
      | HttpStatusCode   | TransactionFee   | Sid   | Message   |
      | <HttpStatusCode> | <TransactionFee> | <Sid> | <Message> |

    Examples: 
      | NICN                   | Amount  | Region | Processor    | HttpStatusCode | TransactionFee | Sid     | Message |
      | MastercardCoreValue    |   49.99 |  00801 | Titanium4994 |            201 |           0.00 | NotNull | ok      |
      | VisaCorporate          |   50.00 |  00801 | Paysafe7861  |            201 |           0.00 | NotNull | ok      |
      | DiscoverRewards        |   20.00 |  00801 | Titanium4994 |            201 |           0.00 | NotNull | ok      |
      | MastercardBusinessCore |    5.00 |  00801 | Paysafe9909  |            201 |           0.00 | NotNull | ok      |
      | VisaSignaturePreferred |  400.00 |  00801 | Paysafe7861  |            201 |           0.00 | NotNull | ok      |
      | AmexStandard           |    2.99 |  00801 | Paysafe9909  |            201 |           0.00 | NotNull | ok      |
      | VisaTraditionalRewards |    7.67 |  00801 | Paysafe7861  |            201 |           0.00 | NotNull | ok      |
      | MastercardWorld        |  253.97 |  00801 | Paysafe7861  |            201 |           0.00 | NotNull | ok      |
      | VisaNonRewards         | 1000.99 |  00801 | Titanium4994 |            201 |           0.00 | NotNull | ok      |

  Scenario Outline: 15 - Verify Surchx Fee and transaction fee with different Virgin Island zipcodes(country code and region mismatch)
    When I call Transaction Fee API with the following data
      | Merchant  | NICN   | Amount   | Region   | Processor   |
      | Coastline | <NICN> | <Amount> | <Region> | <Processor> |
    Then Verify the response is as follows
      | HttpStatusCode   | TransactionFee   | Sid   | Message   |
      | <HttpStatusCode> | <TransactionFee> | <Sid> | <Message> |

    Examples: 
      | NICN                   | Amount  | Region | Processor    | HttpStatusCode | TransactionFee | Sid     | Message |
      | MastercardCoreValue    |   49.99 |  00801 | Titanium4994 |            201 |           0.00 | NotNull | ok      |
      | VisaCorporate          |   50.00 |  00802 | Paysafe7861  |            201 |           0.00 | NotNull | ok      |
      | DiscoverRewards        |   20.00 |  00803 | Titanium4994 |            201 |           0.00 | NotNull | ok      |
      | MastercardBusinessCore |    5.00 |  00804 | Paysafe9909  |            201 |           0.00 | NotNull | ok      |
      | VisaSignaturePreferred |  400.00 |  00805 | Paysafe7861  |            201 |           0.00 | NotNull | ok      |
      | AmexStandard           |    2.99 |  00820 | Paysafe9909  |            201 |           0.00 | NotNull | ok      |
      | VisaTraditionalRewards |    7.67 |  00821 | Paysafe7861  |            201 |           0.00 | NotNull | ok      |
      | MastercardWorld        |  253.97 |  00822 | Paysafe7861  |            201 |           0.00 | NotNull | ok      |
      | VisaNonRewards         | 1000.99 |  00823 | Titanium4994 |            201 |           0.00 | NotNull | ok      |
      | MastercardCoreValue    |   49.99 |  00824 | Titanium4994 |            201 |           0.00 | NotNull | ok      |
      | VisaCorporate          |   50.00 |  00830 | Paysafe7861  |            201 |           0.00 | NotNull | ok      |
      | DiscoverRewards        |   20.00 |  00831 | Titanium4994 |            201 |           0.00 | NotNull | ok      |
      | MastercardBusinessCore |    5.00 |  00840 | Paysafe9909  |            201 |           0.00 | NotNull | ok      |
      | VisaSignaturePreferred |  400.00 |  00841 | Paysafe7861  |            201 |           0.00 | NotNull | ok      |
      | AmexStandard           |    2.99 |  00850 | Paysafe9909  |            201 |           0.00 | NotNull | ok      |
      | VisaTraditionalRewards |    7.67 |  00851 | Paysafe7861  |            201 |           0.00 | NotNull | ok      |

  Scenario Outline: 16 - Verify Surchx Fee and transaction fee with country code as Non-US country code and region 11801
    When I call Transaction Fee API with the following data
      | Merchant  | NICN   | Amount   | Country   | Region   | Processor   |
      | Coastline | <NICN> | <Amount> | <Country> | <Region> | <Processor> |
    Then Verify the response is as follows
      | HttpStatusCode   | TransactionFee   | Sid   | Message   |
      | <HttpStatusCode> | <TransactionFee> | <Sid> | <Message> |

    Examples: 
      | NICN                | Amount | Country | Region | Processor    | HttpStatusCode | TransactionFee                                                 | Sid     | Message |
      | MastercardCoreValue |  49.99 |     850 |  11801 | Titanium4994 |            201 | Interchange:FixedFee:GatewayMarkup:NetworkFee:SurchxPercentage | NotNull | ok      |
      | VisaCorporate       |  50.00 |     124 |  11801 | Paysafe7861  |            201 | Interchange:FixedFee:GatewayMarkup:NetworkFee:SurchxPercentage | NotNull | ok      |
