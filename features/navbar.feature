Feature: Rendering the navbar
  Scenario: The navbar is rendered successfully
  Given the Server is running at "app"
  When I go to "/index.html"
  Then I should see '<nav class="navbar navbar-default" role="navigation">'
