require 'spec_helper'

module ElectricSheep
  
  describe 'Game' do 
    
    describe '.build_tads' do
      
      it 'should contain the author information' do
        ElectricSheep::Game.new(:name => 'Blade Runner').build_tads.should include("name = 'Blade Runner'")
      end
      
    end
    
  end
  
end