Feature: Create TADs folder structure

  # https://github.com/cucumber/aruba/blob/master/lib/aruba/cucumber.rb

  Scenario: I want to generate the files and folders to be able to compile a TADs game
    Given a file named "folder_generator.rb" with:
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

      puts game.build
            
      """
    When I run `ruby folder_generator.rb`
    Then a file named "ExampleGame" should exist
    And a file named "ExampleGame/obj" should exist
    #Then there should be a folder called ""
    #And the folder "" should contain a folder ""
    #And the folder "" should contain a file ""