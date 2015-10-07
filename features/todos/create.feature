Feature: Todo Create
  In order to get my work done
  I need to create my todos

  Scenario: Todo with name
  When the client requests the creation of a todo with the following attributes:
    |name|Walk the dog|
  Then the response is a todo with the following attributes:
    |name|Walk the dog|
