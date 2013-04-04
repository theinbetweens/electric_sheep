Feature: Create valid TADs object
  # See http://www.tads.org/t3doc/doc/gsg/addingitemstothegame.htm for tutorial

  Scenario: I want a golden skull in a valid TADs format
    Given a file named "example_generator.rb" with:
      """
      $LOAD_PATH.unshift File.expand_path( File.join('..','..','lib'))
      require 'electric_sheep'

      # TODO Change to surface - not room
      pedestal = ElectricSheep::Room.new('Pedestal')

      gold_skull = ElectricSheep::Thing.new('gold skull')
      gold_skull.nouns = ['skull','head']
      gold_skull.adjectives = ['gold']
      gold_skull.location = pedestal

      puts gold_skull.write
            
      """
    When I run `ruby example_generator.rb`
    Then the output should contain exactly:
      """   
      goldSkull: Thing
        name = 'gold skull'
        noun = 'skull' 'head'
        adjective = 'gold'
        location = pedestal
      ;
      
      """