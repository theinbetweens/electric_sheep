module ElectricSheep
  
  class Room

  	attr_accessor :desc

  	def initialize(name,options = {})
  		@name = name
  	end

  	def write
      output = []
      output << "firstRoom: Room '#{@name}'"
      output << %Q{  "#{desc}"}
      output << ";"
      output.join("\n")
  	end

  end

 end