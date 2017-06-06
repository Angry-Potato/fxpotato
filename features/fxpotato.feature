Feature: FxPotato
  In order to calculate FX rates
  As a CLI
  I want to be as simple as possible

  Scenario: Rate for GBP to USD on 2017-06-02
    When I run `fxpotato getrate GBP USD -d 2017-06-02`
    Then the output should contain "1.2853508731722967"

  Scenario: Nonsense base input
    When I run `fxpotato getrate bitcoin USD -d 2017-06-02`
    Then the output should contain "Unable to calculate that exchange rate"
    And the output should contain "Unable to find rate for BITCOIN on 2017-06-02"

  Scenario: Nonsense target input
    When I run `fxpotato getrate GBP etherium -d 2017-06-02`
    Then the output should contain "Unable to calculate that exchange rate"
    And the output should contain "Unable to find rate for ETHERIUM on 2017-06-02"

  Scenario: Nonsense date input
    When I run `fxpotato getrate GBP USD -d 2999-06-02`
    Then the output should contain "Unable to calculate that exchange rate"
    And the output should contain "Unable to find rate for GBP on 2999-06-02"
