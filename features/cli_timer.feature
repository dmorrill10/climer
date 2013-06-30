Feature: Help documentation
  In order to tell user's how to use this app
  I want to show useful help documentation.

  Scenario: App just runs and shows help
    When I get help for "cli_timer"
    Then the exit status should be 0
    And the banner should be present
    And the banner should document that this app takes options
    And the following options should be documented:
      |--version|
      |--log-level|

Feature: Shows the time when notifications will go off
  As a user of this app
  I want to specify time durations
  And see the time that notifications will go off after those durations.

  # Scenario: App just runs and shows help
  #   When I get help for "cli_timer"
  #   Then the exit status should be 0
  #   And the banner should be present
  #   And the banner should document that this app takes options
  #   And the following options should be documented:
  #     |--version|
  #     |--log-level|

Feature: Shows a useful notification message and plays a chime when a timer goes off
  As a user of this app
  I want to specify time durations
  And once those durations have elapsed
  I want to see a useful notification message and hear a chime