module ElectricSheep
  
  class Room

    include Models::ActsAsRoom

  	def initialize(name,options = {})
  		@name = name
  	end

  end

 end