require 'spec_helper'

module ElectricSheep
  
  describe 'Actor' do 

    describe '#write' do

      it 'should print out a basic actor in the TADs format' do
        actor = ElectricSheep::Actor.new('me')
        actor.write.should include("me: Actor")
      end

    end

  end

 end