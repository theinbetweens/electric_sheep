require 'spec_helper'

module ElectricSheep
  
  describe 'Room' do 

  	describe '#initialize' do

  		it 'can be initialized' do
        expect {ElectricSheep::Room.new('Starting Room')}.to_not raise_error
  		end

  	end

    describe '#write' do

      #   firstRoom: Room 'Starting Room'
      #     "This is the boring starting rooms."
      #   ; 
      it 'should print out a basic room inthe TADs format' do
        first_room = ElectricSheep::Room.new('Starting Room')
        first_room.desc = %q{This is the boring starting rooms.}
        first_room.write.should include("startingRoom: Room 'Starting Room'")
        first_room.write.should include("This is the boring starting rooms.")
        # TODO Need a nicer way to compare printed output ignoring indentation
      end

      it 'should declare a connection to a north room' do
        outside_cave = ElectricSheep::Room.new('Outside Cave')
        outside_cave.desc = %q{You're standing in the bright sunlight just outside of a large, dark.}

        cave = ElectricSheep::Room.new('Cave')
        cave.desc = %q{You're inside a dark and musty cave. Sunlight pours in from a passage to the south. }

        outside_cave.north = cave  
        outside_cave.write.should include("north = cave")              
        outside_cave.write.should include(%q{desc = "You're standing in the bright sunlight just outside of a large, dark.})
      end

    end

    describe '#tad_object_name' do

      it 'should format the name of the room in camelCase' do
        room = ElectricSheep::Room.new('Starting Room')
        room.tad_object_name.should == 'startingRoom'
      end

    end

  end

 end