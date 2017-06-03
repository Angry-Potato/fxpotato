Feature: FxPotato
  In order to calculate FX rates
  As a CLI
  I want to be as simple as possible

  Scenario: Rate for GBP to USD on 2017-06-02
    When I run `fxpotato getrate 2017-06-02 GBP USD`
    Then the output should contain "1.2853508731722967"
    And the exit status should be 0
