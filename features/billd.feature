Feature: Billd

  Scenario:
    Given a file named "build.xml" with:
      """
      <Projects>
        <Project name="successful-project" lastBuildStatus="Success" activity="Sleeping"/>
        <Project name="building-from-success-project" lastBuildStatus="Success" activity="Building"/>
        <Project name="building-from-failure-project" lastBuildStatus="Failure" activity="Building"/>
        <Project name="failed-project" lastBuildStatus="Failure" activity="Sleeping"/>
      </Projects>
      """
    When I run `billd build.xml`
    And the stdout should contain:
      """
      successful-project: Success!
      building-from-success-project: Building!
      building-from-failure-project: Building!
      failed-project: Failure!
      """
    Then the exit status should be 0
