Feature: Test command
  In order to run tests written in good old shell/bash
  As a user of Busser
  I want my tests to run when the bash runner plugin is installed

  Background:
    Given a test BUSSER_ROOT directory named "busser-bash-test"
    When I successfully run `busser plugin install busser-bash --force-postinstall`
    Given a suite directory named "bash"

  Scenario: A passing test suite
    Given a file in suite "bash" named "foo_spec.bash" with:
    """
    #!/usr/bin/env bash
    set -e

    echo "A bash test"
    exit 0
    """
    When I run `busser test bash`
    Then the output should contain "[bash] foo_spec.bash"
    And the output should match /^A bash test$/
    And the exit status should be 0

  Scenario: A failing test suite
    Given a file in suite "bash" named "foo_spec.bash" with:
    """
    #!/usr/bin/env bash
    set -e

    echo "A failing bash test"
    exit 99
    """
    When I run `busser test bash`
    And the exit status should not be 0
