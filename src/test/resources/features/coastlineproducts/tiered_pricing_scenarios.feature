Feature: As a user, I want to see a successful call to the TransactionFee API So that I can verify the tiered pricing calculations are being calculated in a right way.

  Scenario Outline: 1 - Verify Transaction Fee API call with different types of VISA cards with Paymentworld5654 processor
    When I call Transaction Fee API with the following data
      | Merchant  | NICN   | Amount   | Region   | Processor   |
      | Coastline | <NICN> | <Amount> | <Region> | <Processor> |
    Then Verify the response is as follows
      | HttpStatusCode   | TransactionFee   | Sid   | Message   |
      | <HttpStatusCode> | <TransactionFee> | <Sid> | <Message> |

    Examples: 
      | NICN                   | Amount | Region               | Processor        | HttpStatusCode | TransactionFee                                        | Sid     | Message |
      | VisaTraditionalRewards | 100.00 | Chargeable state     | Paymentworld5654 |            201 | TierQualifiedPercentage:TierFixedFee:SurchxPercentage | NotNull | ok      |
      | VisaNonRewards         |  10.00 | Chargeable state     | Paymentworld5654 |            201 | TierQualifiedPercentage:TierFixedFee:SurchxPercentage | NotNull | ok      |
      | VisaSignature          |   7.56 | Chargeable state     | Paymentworld5654 |            201 | TierQualifiedPercentage:TierFixedFee:SurchxPercentage | NotNull | ok      |
      | VisaSignaturePreferred | 107.00 | Chargeable state     | Paymentworld5654 |            201 | TierQualifiedPercentage:TierFixedFee:SurchxPercentage | NotNull | ok      |
      | VisaCorporate          |  49.88 | Chargeable state     | Paymentworld5654 |            201 | TierQualifiedPercentage:TierFixedFee:SurchxPercentage | NotNull | ok      |
      | VisaTraditionalRewards | 100.00 | Non-Chargeable state | Paymentworld5654 |            201 |                                                  0.00 | NotNull | ok      |

  Scenario Outline: 2 - Verify Transaction Fee API call with different types of VISA cards with Paymentworld6963 processor
    When I call Transaction Fee API with the following data
      | Merchant  | NICN   | Amount   | Region   | Processor   |
      | Coastline | <NICN> | <Amount> | <Region> | <Processor> |
    Then Verify the response is as follows
      | HttpStatusCode   | TransactionFee   | Sid   | Message   |
      | <HttpStatusCode> | <TransactionFee> | <Sid> | <Message> |

    Examples: 
      | NICN                   | Amount | Region               | Processor        | HttpStatusCode | TransactionFee                                        | Sid     | Message |
      | VisaTraditionalRewards | 100.00 | Chargeable state     | Paymentworld6963 |            201 | TierQualifiedPercentage:TierFixedFee:SurchxPercentage | NotNull | ok      |
      | VisaNonRewards         |  10.00 | Chargeable state     | Paymentworld6963 |            201 | TierQualifiedPercentage:TierFixedFee:SurchxPercentage | NotNull | ok      |
      | VisaSignature          |   7.56 | Chargeable state     | Paymentworld6963 |            201 | TierQualifiedPercentage:TierFixedFee:SurchxPercentage | NotNull | ok      |
      | VisaSignaturePreferred | 107.00 | Chargeable state     | Paymentworld6963 |            201 | TierQualifiedPercentage:TierFixedFee:SurchxPercentage | NotNull | ok      |
      | VisaCorporate          |  49.88 | Chargeable state     | Paymentworld6963 |            201 | TierQualifiedPercentage:TierFixedFee:SurchxPercentage | NotNull | ok      |
      | VisaTraditionalRewards | 100.00 | Non-Chargeable state | Paymentworld6963 |            201 |                                                  0.00 | NotNull | ok      |

  Scenario Outline: 3 - Verify Transaction Fee API call with different types of MASTERCARD with Paymentworld5654 processor
    When I call Transaction Fee API with the following data
      | Merchant  | NICN   | Amount   | Region   | Processor   |
      | Coastline | <NICN> | <Amount> | <Region> | <Processor> |
    Then Verify the response is as follows
      | HttpStatusCode   | TransactionFee   | Sid   | Message   |
      | <HttpStatusCode> | <TransactionFee> | <Sid> | <Message> |

    Examples: 
      | NICN                         | Amount | Region               | Processor        | HttpStatusCode | TransactionFee                                        | Sid     | Message |
      | MastercardCoreValue          | 100.00 | Chargeable state     | Paymentworld5654 |            201 | TierQualifiedPercentage:TierFixedFee:SurchxPercentage | NotNull | ok      |
      | MastercardWorld              |  10.00 | Chargeable state     | Paymentworld5654 |            201 | TierQualifiedPercentage:TierFixedFee:SurchxPercentage | NotNull | ok      |
      | MastercardBusinessCore       | 107.00 | Chargeable state     | Paymentworld5654 |            201 | TierQualifiedPercentage:TierFixedFee:SurchxPercentage | NotNull | ok      |
      | MastercardBusinessWorldElite |  49.88 | Chargeable state     | Paymentworld5654 |            201 | TierQualifiedPercentage:TierFixedFee:SurchxPercentage | NotNull | ok      |
      | MastercardCoreValue          | 100.00 | Non-Chargeable state | Paymentworld5654 |            201 |                                                  0.00 | NotNull | ok      |

  Scenario Outline: 4 - Verify Transaction Fee API call with different types of MASTERCARD with Paymentworld5654 processor
    When I call Transaction Fee API with the following data
      | Merchant  | NICN   | Amount   | Region   | Processor   |
      | Coastline | <NICN> | <Amount> | <Region> | <Processor> |
    Then Verify the response is as follows
      | HttpStatusCode   | TransactionFee   | Sid   | Message   |
      | <HttpStatusCode> | <TransactionFee> | <Sid> | <Message> |

    Examples: 
      | NICN                         | Amount | Region               | Processor        | HttpStatusCode | TransactionFee                                        | Sid     | Message |
      | MastercardCoreValue          | 100.00 | Chargeable state     | Paymentworld6963 |            201 | TierQualifiedPercentage:TierFixedFee:SurchxPercentage | NotNull | ok      |
      | MastercardWorld              |  10.00 | Chargeable state     | Paymentworld6963 |            201 | TierQualifiedPercentage:TierFixedFee:SurchxPercentage | NotNull | ok      |
      | MastercardBusinessCore       | 107.00 | Chargeable state     | Paymentworld6963 |            201 | TierQualifiedPercentage:TierFixedFee:SurchxPercentage | NotNull | ok      |
      | MastercardBusinessWorldElite |  49.88 | Chargeable state     | Paymentworld6963 |            201 | TierQualifiedPercentage:TierFixedFee:SurchxPercentage | NotNull | ok      |
      | MastercardCoreValue          | 100.00 | Non-Chargeable state | Paymentworld6963 |            201 |                                                  0.00 | NotNull | ok      |

  Scenario Outline: 5 - Verify Transaction Fee API call with different types of DISCOVER with Paymentworld5654 processor
    When I call Transaction Fee API with the following data
      | Merchant  | NICN   | Amount   | Region   | Processor   |
      | Coastline | <NICN> | <Amount> | <Region> | <Processor> |
    Then Verify the response is as follows
      | HttpStatusCode   | TransactionFee   | Sid   | Message   |
      | <HttpStatusCode> | <TransactionFee> | <Sid> | <Message> |

    Examples: 
      | NICN            | Amount | Region               | Processor        | HttpStatusCode | TransactionFee                                        | Sid     | Message |
      | DiscoverCore    | 100.00 | Chargeable state     | Paymentworld5654 |            201 | TierQualifiedPercentage:TierFixedFee:SurchxPercentage | NotNull | ok      |
      | DiscoverRewards |  49.88 | Chargeable state     | Paymentworld5654 |            201 | TierQualifiedPercentage:TierFixedFee:SurchxPercentage | NotNull | ok      |
      | DiscoverCore    | 100.00 | Non-Chargeable state | Paymentworld5654 |            201 |                                                  0.00 | NotNull | ok      |

  Scenario Outline: 6 - Verify Transaction Fee API call with different types of DISCOVER with Paymentworld5654 processor
    When I call Transaction Fee API with the following data
      | Merchant  | NICN   | Amount   | Region   | Processor   |
      | Coastline | <NICN> | <Amount> | <Region> | <Processor> |
    Then Verify the response is as follows
      | HttpStatusCode   | TransactionFee   | Sid   | Message   |
      | <HttpStatusCode> | <TransactionFee> | <Sid> | <Message> |

    Examples: 
      | NICN            | Amount | Region               | Processor        | HttpStatusCode | TransactionFee                                        | Sid     | Message |
      | DiscoverCore    | 100.00 | Chargeable state     | Paymentworld6963 |            201 | TierQualifiedPercentage:TierFixedFee:SurchxPercentage | NotNull | ok      |
      | DiscoverRewards |  10.99 | Chargeable state     | Paymentworld6963 |            201 | TierQualifiedPercentage:TierFixedFee:SurchxPercentage | NotNull | ok      |
      | DiscoverCore    | 100.00 | Non-Chargeable state | Paymentworld6963 |            201 |                                                  0.00 | NotNull | ok      |

  Scenario Outline: 7 - Verify Transaction Fee API call with different types of AMEX with Paymentworld5654 processor
    When I call Transaction Fee API with the following data
      | Merchant  | NICN   | Amount   | Region   | Processor   |
      | Coastline | <NICN> | <Amount> | <Region> | <Processor> |
    Then Verify the response is as follows
      | HttpStatusCode   | TransactionFee   | Sid   | Message   |
      | <HttpStatusCode> | <TransactionFee> | <Sid> | <Message> |

    Examples: 
      | NICN         | Amount | Region               | Processor        | HttpStatusCode | TransactionFee                                        | Sid     | Message |
      | AmexStandard |  80.00 | Chargeable state     | Paymentworld5654 |            201 | TierQualifiedPercentage:TierFixedFee:SurchxPercentage | NotNull | ok      |
      | AmexStandard |   5.60 | Non-Chargeable state | Paymentworld5654 |            201 |                                                  0.00 | NotNull | ok      |

  Scenario Outline: 8 - Verify Transaction Fee API call with different types of AMEX with Paymentworld6963 processor
    When I call Transaction Fee API with the following data
      | Merchant  | NICN   | Amount   | Region   | Processor   |
      | Coastline | <NICN> | <Amount> | <Region> | <Processor> |
    Then Verify the response is as follows
      | HttpStatusCode   | TransactionFee   | Sid   | Message   |
      | <HttpStatusCode> | <TransactionFee> | <Sid> | <Message> |

    Examples: 
      | NICN         | Amount | Region               | Processor        | HttpStatusCode | TransactionFee                                        | Sid     | Message |
      | AmexStandard |  80.00 | Chargeable state     | Paymentworld6963 |            201 | TierQualifiedPercentage:TierFixedFee:SurchxPercentage | NotNull | ok      |
      | AmexStandard |  67.87 | Non-Chargeable state | Paymentworld6963 |            201 |                                                  0.00 | NotNull | ok      |
