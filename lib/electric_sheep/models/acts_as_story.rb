module ElectricSheep
	module Models

    module ActsAsStory
    	#extend ActiveSupport::Concern

      #attr_accessor :initialPlayerChar, :rooms, :actors, :name
      attr_accessor :initialPlayerChar, :values #:actors, :name, :values

      def build_tads
        str = []

        str << '#include <adv3.h>'
        str << '#include <en_us.h>'

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

        # # TODO This a quick hack so it can compile
        # output += "\n"
        # output += 'me: Actor'
        # output += "\n"
        # output += ';'

        output
      end   

      def t_file_name
        #name.downcase.gsub(/\s+/,'')+'.t'
        camel_case_name+'.t'
      end   

      def t3m_file_name
        #name.downcase.gsub(/\s+/,'')+'.t3m'
        camel_case_name+'.t3m'
      end

      def camel_case_name
        name.split(/\s+/).collect(&:capitalize).join('')
      end

      def t3m_file_content
        str = []
        str << '-D LANGUAGE=en_us'
        str << '-D MESSAGESTYLE=neu'
        str << '-Fy obj -Fo obj'
        str << "-o #{camel_case_name}.t3"
        str << '-lib system'
        str << '-lib adv3/adv3'
        str << "-source #{camel_case_name}"
        str.join("\n")
      end

      def game_info_output
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
        str = []
        str << 'IFID: b8563851-6257-77c3-04ee-278ceaeb48ac'
        str << 'Name: My First Game'
        str << 'Byline: by Bob Author'
        str << "AuthorEmail: Bob Author <bob@myisp.com>"
        str << 'Desc: This is an example of how to start a new game project.'
        str << 'Version: 1'
        str << "ReleaseDate: 2013-01-27"
        str << "Language: en-US"
        str << "LicenseType: Freeware"
        str << "CopyingRules: Nominal cost only; compilations allowed"
        str << "PresentationProfile: Default"
        str.join("\n")        
      end

    end

  end
end