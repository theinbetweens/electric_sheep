require 'spec_helper'

module ElectricSheep
  
  describe 'Builder' do 
    
    describe '.interpret' do
      
      it 'should parse a simple table on a lamp story into TADs format' do
        story = "In the room there is a table.  On the table is a lamp."
        File.stub(:open).with('story.yml').and_yield(StringIO.new(story.strip))
        ElectricSheep::Builder.interpret('story.yml').should == 
      %q{
      cave: room
        sdesc = "Cave"
        ldesc = "You're inside a dark and musty cave. Sunlight
        pours in from a passage to the south. "
        south = startroom
      ;
      }
      end
      
    end
    
  end
  
end