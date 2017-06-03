Feature: FxPotato
  In order to calculate FX rates
  As a CLI
  I want to be as simple as possible

  Scenario: Rate for GBP to USD on 2017-06-02
    When I run `fxpotato 2017-06-02 GBP USD`
    Then the output should contain "blerg"
    And the exit status should be 0
