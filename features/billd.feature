Feature: Billd

  Scenario:
    When I run `billd https://raw.github.com/gist/b08579f1a271913bec33/a3d6ab315397f8fec5c8ab05bcf45c93606a4e88/build.xml`
    Then the stdout should contain:
      """
      successful-project: Success!
      building-from-success-project: Building!
      building-from-failure-project: Building!
      failed-project: Failure!
      """
    And the exit status should be 0
