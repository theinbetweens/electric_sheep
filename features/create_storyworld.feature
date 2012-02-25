Feature: Generate TADs version of story

  You play a character called Goldielocks.  She is in the woods.  In the words 
  there is a cottage.  Inside the cottage is a room.  In the room is a table.  On
  the table are three bowls of porrage. One bowl of porrage is hot.  
  One bowl of porrage is cold.  One bowl is the right temperature.

  Scenario: Generate basic story
    Given a file named "story.txt" with:
      """
      In the room there is a table.  On the table is a lamp.
      """
    And a file named "electric_sheep.rb" with:
      """
      require 'electric_sheep'
      
      ElectricSheep.interpret('story.txt')
      """
    When I run "electric_sheep.rb"
    Then the file "output.txt" should contain:
      """
      cave: room
        sdesc = "Cave"
        ldesc = "You're inside a dark and musty cave. Sunlight
        pours in from a passage to the south. "
        south = startroom
      ;      
      """  
    
