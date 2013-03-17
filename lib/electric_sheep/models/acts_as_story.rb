module ElectricSheep
	module Models

    module ActsAsStory
    	#extend ActiveSupport::Concern

      #attr_accessor :initialPlayerChar, :rooms, :actors, :name
      attr_accessor :initialPlayerChar, :values #:actors, :name, :values

      def build_tads
        str = []
        str << 'gameMain: GameMainDef'
        str << "  initialPlayerChar = me"
        str << ';'
        str << ''
        str << 'versionInfo: GameID'
        values.each {|key,value| str << "  #{key} = '#{value}'" }
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

      def t_file_name
        name.downcase.gsub(/\s+/,'-')+'.t'
      end   

      def t3m_file_name
        name.downcase.gsub(/\s+/,'-')+'.t3m'
      end

      def t3m_file_content
        str = []
        str << '-D LANGUAGE=en_us'
        str << '-D MESSAGESTYLE=neu'
        str << '-Fy obj -Fo obj'
        str << "-o #{name}.t3"
        str << '-lib system'
        str << '-lib adv3/adv3'
        str << "-source #{name}"
        str.join("\n")
      end

    end

  end
end