Feature: Pet clinic home page and menu options

  Scenario: As a internet user I access pet clinic home page
    When I launch Pet clinic site
    Then I should see the home page

  Scenario: As a user I navigate to Find owners page
    Given I launch Pet clinic site
    And I should see the home page
    When I navigate to Find owners page
    Then I should see option to find owners

  Scenario: As a user I navigate to Veterinaries page
    Given I launch Pet clinic site
    And I should see the home page
    When I navigate to Veterinaries page
    Then I should see Veterinaries list