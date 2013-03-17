require 'spec_helper'

module ElectricSheep
  
  describe 'Game' do 
    
    describe '.build_tads' do
      
      it 'should contain the author information' do
        ElectricSheep::Game.new(:name => 'Blade Runner').build_tads.should include("name = 'Blade Runner'")
      end
      
    end

    describe '.build' do

    	it 'should generate a game directory on build' do
    		ElectricSheep::Game.new(:name => 'Blade Runner').build
    		File.exists?('BladeRunner').should == true
    	end

    end

    describe '#t_file_name' do

      it 'should return a file name based on the story name' do
        game = ElectricSheep::Game.new(:name => 'Blade Runner')
        game.t_file_name.should == 'blade-runner.t'
      end

    end


    describe '#t3m_file_name' do

      it 'should return a valid *.t3m file name' do
        game = ElectricSheep::Game.new(:name => 'Blade Runner')
        game.t3m_file_name.should == 'blade-runner.t3m'      
      end

    end

    describe '#t3m_file_content' do

      it 'should contain t3m values' do
        # TODO Need nicer way to compare generated files
        ElectricSheep::Game.new(:name => 'MyGame').t3m_file_content.should include("-D LANGUAGE=en_us")
        ElectricSheep::Game.new(:name => 'MyGame').t3m_file_content.should include("-D MESSAGESTYLE=neu")
        ElectricSheep::Game.new(:name => 'MyGame').t3m_file_content.should include("-Fy obj -Fo obj")
        ElectricSheep::Game.new(:name => 'MyGame').t3m_file_content.should include("-o MyGame.t3")     
        ElectricSheep::Game.new(:name => 'MyGame').t3m_file_content.should include("-lib system")
        ElectricSheep::Game.new(:name => 'MyGame').t3m_file_content.should include("-lib adv3/adv3")
        ElectricSheep::Game.new(:name => 'MyGame').t3m_file_content.should include("-source MyGame")    
      end

      # """
      # -D LANGUAGE=en_us
      # -D MESSAGESTYLE=neu
      # -Fy obj -Fo obj
      # -o MyGame.t3
      # -lib system
      # -lib adv3/adv3
      # -source MyGame      
      # """.strip
    end
    
  end
  
end