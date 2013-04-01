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