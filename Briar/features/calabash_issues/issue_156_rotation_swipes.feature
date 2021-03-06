@rotation
@issue_156
Feature: swipes should work in all orientations

  Background: i should see the text related view
    When I touch the Text tab, I should see the Text related part of the app


  # outlines are NYI on XTC
  @not_xtc
  Scenario Outline: swipes should work in any orientation
    # ruby mine cant find this even though it is defined
    # Then I rotate the device so the home button is on the <position>
    Then I rotate the home button to the <position> position
    Then I swipe <swipe> on the <field> text field
    Then I should see the <field> text field has <text>

  # mixed the orientations up
  Examples: for exhaustive rotation and swipe testing
    | position    | swipe | field  | text           |
    | down        | left  | top    | "swiped left"  |
    | top         | right | bottom | "swiped right" |
    | left        | right | bottom | "swiped right" |
    | right       | right | bottom | "swiped right" |
    | down        | left  | bottom | "swiped left"  |
    | right       | left  | top    | "swiped left"  |
    | top         | right | top    | "swiped right" |
    | down        | right | top    | "swiped right" |
    | left        | right | top    | "swiped right" |
    | right       | left  | bottom | "swiped left"  |
    | top         | left  | bottom | "swiped left"  |
    | down        | right | bottom | "swiped right" |
    | right       | right | top    | "swiped right" |
    | top         | left  | top    | "swiped left"  |
    | left        | left  | bottom | "swiped left"  |
    | left        | left  | top    | "swiped left"  |

