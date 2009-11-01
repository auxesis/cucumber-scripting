Feature: Copy files around
  
  Scenario: A single file
    Given I am in "/tmp"
    And the file "spoons" exists
    When I copy the file "spoons" to "forks"
    Then the file "forks" should exist
    And the file "forks" should be readable

  Scenario: Multiple files
    Given I am in "/tmp"
    Given the following table of tasty fruit:
      | filename |
      | apples   | 
      | oranges  |
      | bananas  |
      | ananas   |
      | file with lots o spaces |
      | spoons of : doom |
    When I create the directory "/tmp/some_other_dir"
    When I copy the tasty fruit in the table to "/tmp/some_other_dir"
    Then the tasty fruit in the table should exist in "/tmp/some_other_dir"

  Scenario: Do things i'm not allowed to 
    When I create the directory "/usr/bin/wtf"

  Scenario: Copy based on a pattern
    Given I am in "/tmp"
    When I create the directory "/tmp/pattern_dir"
    When I copy files beginning with the letters z,y,x to "/tmp/pattern_dir"
    Then they should exist there





