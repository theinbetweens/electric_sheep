require 'spec_helper'

module ElectricSheep
  
  describe 'Thing' do 

    describe '#initialize' do

      it 'can be initialized' do
        expect {ElectricSheep::Thing.new('gold skull')}.to_not raise_error
      end

    end

    describe '#write' do

      # goldSkull: Thing  
      #   name = 'gold skull'  
      #   noun = 'skull' 'head'  
      #   adjective = 'gold'  
      #   location = pedestal  
      # ;
      it 'should camelcase the the object name' do
        thing = ElectricSheep::Thing.new('gold skull')
        thing.write.should include("goldSkull: Thing")
      end

      it 'should output location declaration' do
        thing = ElectricSheep::Thing.new('gold skull')
        room = ElectricSheep::Room.new('living room')
        thing.location = room
        thing.write.should include "location = livingRoom"
      end      

    end

  end

 end