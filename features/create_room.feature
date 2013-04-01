Feature: Create TADs Room

  Scenario: Generate TAD format room
    Given a file named "example_generator.rb" with:
      """
      $LOAD_PATH.unshift File.expand_path( File.join('..','..','lib'))
      require 'electric_sheep'

      start_room = ElectricSheep::Room.new('Start Room')
      start_room.desc = %q{This is the starting room. }

      puts start_room.write
            
      """
    When I run `ruby example_generator.rb`
    Then the output should contain exactly:
      """
      startRoom: Room 'Start Room'
        "This is the starting room. "
      ;

      """

  Scenario: Create connecting tad rooms
    Given a file named "example_generator.rb" with:
      """
      $LOAD_PATH.unshift File.expand_path( File.join('..','..','lib'))
      require 'electric_sheep'

      outside_cave = ElectricSheep::Room.new('Outside Cave')
      outside_cave.desc = %q{You're standing in the bright sunlight just outside of a large, dark, foreboding cave, which lies to the north.}

      cave = ElectricSheep::Room.new('Cave')
      cave.desc = %q{You're inside a dark and musty cave. Sunlight pours in from a passage to the south. }

      outside_cave.north = cave
      cave.south = outside_cave

      puts outside_cave.write
            
      """
    When I run `ruby example_generator.rb`
    Then the output should contain exactly:
      """
      outsideCave: Room 'Outside Cave'
        desc = "You're standing in the bright sunlight just outside of a large, dark, foreboding cave, which lies to the north."
        north = cave
      ;

      """