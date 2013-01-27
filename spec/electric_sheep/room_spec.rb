require 'spec_helper'

module ElectricSheep
  
  describe 'Room' do 

  	describe '#initialize' do

  		it 'can be initialized' do
        expect {ElectricSheep::Room.new('Starting Room')}.to_not raise_error
  		end

  	end

    describe '#write' do

      it 'should print out a basic room inthe TADs format' do
        first_room = ElectricSheep::Room.new('Starting Room')
        first_room.desc = %q{This is the boring starting rooms.}
        first_room.write.should include("firstRoom: Room 'Starting Room'")
        first_room.write.should include("This is the boring starting rooms.")
        # TODO Need a ncie way to compare printed output ignoring indentation

        # first_room.write.should == %q{
        #   firstRoom: Room 'Starting Room'
        #     "This is the boring starting rooms."
        #   ;          
        # }
      end

    end

  end

 end