module ElectricSheep

  class Actor

    attr_accessor :location

  	def initialize(name)
  		@name = name
  	end

  	def write
  	 # %Q{
    #   #{@name}: Actor
    #     location = firstRoom
    #   ;      
    #  }
      output = []
      output << "#{@name}: Actor"
      output << %Q{  location = firstRoom}
      output << ";"
      output.join("\n")
  	end

  end

end