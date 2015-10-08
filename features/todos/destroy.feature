Feature: Todo Destroy
  In order to mark things I have done
  I need to destroy my todos

  Scenario: Existing Todo
  Given the system knows about the following todos:
    | name           |
    | Walk the dog   |
    | Clean the hall |
  When the client requests deletion of the first todo
  Then the response is a todo with the following attributes:
    |name|Walk the dog|