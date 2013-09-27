@driis
@rotation
@wip
Feature: i want to be able to rotate and touch things on iOS 7

  Background:  start on the first view
    When I touch the "First" tab I should see the "first" view


  Scenario Outline: should be able to touch buttons in any orientation
    Then I rotate the home button to the <position> position
    Then I wait for rotation animation
    When I touch the <button_id> button I should see an <what>
  Examples:
    | position | button_id    | what               |
    | down     | "show alert" | alert              |
    | up       | "show email" | email compose view |
    | down     | "show sheet" | action sheet       |
    | left     | "show alert" | alert              |
    | down     | "show email" | email compose view |
    | right    | "show email" | email compose view |
    | up       | "show sheet" | action sheet       |
    | left     | "show sheet" | action sheet       |
    | up       | "show alert" | alert              |
    | right    | "show sheet" | action sheet       |
    | left     | "show email" | email compose view |
    | right    | "show alert" | alert              |
