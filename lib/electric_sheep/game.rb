
module ElectricSheep

  class Game

    #attr_accessor :initialPlayerChar, :rooms, :actors
    include Models::ActsAsStory

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

  end

end