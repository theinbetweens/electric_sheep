
module ElectricSheep

  class Game

    attr_accessor :initialPlayerChar, :rooms, :actors

    def initialize(options = {} )
      @structure = Struct.new(:name,:byline, :authorEmail, :desc, :version)
      @values = @structure.members.inject({}) do |total,x| 
        if options.has_key?(x)
          total[x] = options[x]
        end
        total
      end
      @rooms = []
      @actors = []
    end

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