module ElectricSheep
	module Models

    module ActsAsStory
    	#extend ActiveSupport::Concern

      attr_accessor :initialPlayerChar, :rooms, :actors

      def build_tads
        str = []
        str << 'gameMain: GameMainDef'
        str << "  initialPlayerChar = me"
        str << ';'
        str << ''
        str << 'versionInfo: GameID'
        @values.each {|key,value| str << "  #{key} = '#{value}'" }
        str << ';'
        output = str.join("\n")
        unless rooms.empty?
          output += "\n\n"
          output += rooms.first.write
        end
        unless actors.empty?
          output += "\n\n"
          output += actors.first.write
        end
        output
      end      

    end

  end
end