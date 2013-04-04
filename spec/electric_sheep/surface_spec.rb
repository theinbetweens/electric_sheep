require 'spec_helper'

module ElectricSheep
  
  describe 'Surface' do 

    describe '#initialize' do

      it 'can be initialized' do
        expect {ElectricSheep::Surface.new('pedestal')}.to_not raise_error
      end

    end

    describe '#write' do

      # pedestal: Surface, Fixture  
      #   name = 'pedestal'  
      #   noun = 'pedestal'  
      #   location = cave  
      # ;
      it 'should camelcase the the object name' do
        surface = ElectricSheep::Surface.new('pedestal')
        surface.write.should include("pedestal: Surface")
      end

      it 'should outputs noun information' do
        surface = ElectricSheep::Surface.new('pedestal')
        surface.nouns << 'pedestal'
        surface.write.should include "noun = 'pedestal'"
      end

      it 'should output location declaration' do
        surface = ElectricSheep::Surface.new('pedestal')
        room = ElectricSheep::Room.new('living room')
        surface.location = room
        surface.write.should include "location = livingRoom"
      end

    end

  end

 end