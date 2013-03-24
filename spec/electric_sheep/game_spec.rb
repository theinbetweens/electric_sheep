require 'spec_helper'

module ElectricSheep
  
  describe 'Game' do 
    
    describe '.build_tads' do
      
      it 'should contain the author information' do
        ElectricSheep::Game.new(:name => 'Blade Runner').build_tads.should include("name = 'Blade Runner'")
      end

      it 'should include the standard phython includes' do
         #include <adv3.h>
     #include <en_us.h>
        ElectricSheep::Game.new(:name => 'Blade Runner').build_tads.should include("#include <adv3.h>")
        ElectricSheep::Game.new(:name => 'Blade Runner').build_tads.should include("#include <en_us.h>")
      end
      
    end

    # describe '.build' do

    # 	it 'should generate a game directory on build' do
    # 		ElectricSheep::Game.new(:name => 'Blade Runner').build
    # 		File.exists?('BladeRunner').should == true
    # 	end

    # end

    describe '.game_info_output' do

      it 'should generate the standard output for the GameInfo.txt' do
        # IFID: b8563851-6257-77c3-04ee-278ceaeb48ac
        # Name: My First Game
        # Byline: by Bob Author
        # AuthorEmail: Bob Author <bob@myisp.com>
        # Desc: This is an example of how to start a new game project. 
        # Version: 1
        # ReleaseDate: 2013-01-27
        # Language: en-US
        # LicenseType: Freeware
        # CopyingRules: Nominal cost only; compilations allowed
        # PresentationProfile: Default        
        ElectricSheep::Game.new(:name => 'Blade Runner').game_info_output.should include("AuthorEmail: Bob Author <bob@myisp.com>")
        ElectricSheep::Game.new(:name => 'Blade Runner').game_info_output.should include("Language: en-US")
        ElectricSheep::Game.new(:name => 'Blade Runner').game_info_output.should include("PresentationProfile: Default")
      end

    end

    describe '#t_file_name' do

      it 'should return a file name based on the story name' do
        game = ElectricSheep::Game.new(:name => 'Blade Runner')
        game.t_file_name.should == 'BladeRunner.t'
      end

    end


    describe '#t3m_file_name' do

      it 'should return a valid *.t3m file name' do
        game = ElectricSheep::Game.new(:name => 'Blade Runner')
        game.t3m_file_name.should == 'BladeRunner.t3m'      
      end

    end

    describe '#t3m_file_content' do

      it 'should contain t3m values' do
        # TODO Need nicer way to compare generated files
        ElectricSheep::Game.new(:name => 'My Game').t3m_file_content.should include("-D LANGUAGE=en_us")
        ElectricSheep::Game.new(:name => 'My Game').t3m_file_content.should include("-D MESSAGESTYLE=neu")
        ElectricSheep::Game.new(:name => 'My Game').t3m_file_content.should include("-Fy obj -Fo obj")
        ElectricSheep::Game.new(:name => 'My Game').t3m_file_content.should include("-o MyGame.t3")     
        ElectricSheep::Game.new(:name => 'My Game').t3m_file_content.should include("-lib system")
        ElectricSheep::Game.new(:name => 'My Game').t3m_file_content.should include("-lib adv3/adv3")
        ElectricSheep::Game.new(:name => 'My Game').t3m_file_content.should include("-source MyGame")    
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