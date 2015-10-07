Feature: Todo List
  In order to get my work done
  I need to list my todos

  Scenario: List Todos
  Given the system knows about the following todos:
    | name           |
    | Walk the dog   |
    | Clean the hall |
  When the client requests a list of todos
  Then the response is a list containing two todos
  And one todo has the following attributes:
    | attribute | type   | value        |
    | name      | String | Walk the dog |
  And one todo has the following attributes:
    | attribute | type   | value          |
    | name      | String | Clean the hall |
