@wip
Feature: BuildP

  Scenario:
    Given a file named "build.xml" with:
      """
      <Projects>
        <Project name="my-project" lastBuildStatus="Success" activity="Sleeping"/>
      </Projects>
      """
    When I run `buildp build.xml`
    Then the exit status should be 0
    And the stdout should contain:
      """
      my-project: Success!
      """
  
  Scenario:
    Given a file named "build.xml" with:
      """
      <Projects>
        <Project name="my-project" lastBuildStatus="Success" activity="Building"/>
      </Projects>
      """
    When I run `buildp build.xml`
    Then the exit status should be 0
    And the stdout should contain:
      """
      my-project: Building!
      """

  Scenario:
    Given a file named "build.xml" with:
      """
      <Projects>
        <Project name="my-project" lastBuildStatus="Failure" activity="Sleeping"/>
      </Projects>
      """
    When I run `buildp build.xml`
    Then the exit status should be 0
    And the stdout should contain:
      """
      my-project: Failure!
      """

  Scenario:
    Given a file named "build.xml" with:
      """
      <Projects>
        <Project name="my-project" lastBuildStatus="Failure" activity="Building"/>
      </Projects>
      """
    When I run `buildp build.xml`
    Then the exit status should be 0
    And the stdout should contain:
      """
      my-project: Building!
      """

