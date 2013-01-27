Feature: Generate TADs version of story

  You play a character called Goldielocks.  She is in the woods.  In the words 
  there is a cottage.  Inside the cottage is a room.  In the room is a table.  On
  the table are three bowls of porrage. One bowl of porrage is hot.  
  One bowl of porrage is cold.  One bowl is the right temperature.
  
  # TODO The last definition should be in aruba - not sure why it isn't comming through

  @announce @slow_process
  Scenario: Generate empty tad file
    Given a file named "example_generator.rb" with:
      """
      $LOAD_PATH.unshift File.expand_path( File.join('..','..','lib'))
      require 'electric_sheep'

      game = ElectricSheep::Game.new(
        :name => 'Blade Runner', :byline => 'by Philip K. Dick',
        :desc => 'Dystopian future where replicants walk amoungst us',
        :version => '1',
        :authorEmail => 'Bob <bob@example.com>'
      )

      first_room = ElectricSheep::Room.new('Starting Room')
      first_room.desc = %q{This is the boring starting rooms.}

      me = ElectricSheep::Actor.new('me')
      me.location = first_room

      game.initialPlayerChar = me

      game.rooms << first_room
      game.actors << me

      puts game.build_tads
            
      """
    When I run `ruby example_generator.rb`
    Then the output should contain exactly:
      """
      gameMain: GameMainDef
        initialPlayerChar = me
      ;

      versionInfo: GameID
        name = 'Blade Runner'
        byline = 'by Philip K. Dick'
        authorEmail = 'Bob <bob@example.com>'
        desc = 'Dystopian future where replicants walk amoungst us'
        version = '1'
      ;

      firstRoom: Room 'Starting Room'
        "This is the boring starting rooms."
      ;

      me: Actor
        location = firstRoom
      ;
      
      """