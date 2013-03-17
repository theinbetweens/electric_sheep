module ElectricSheep
  
  class Room

    include Models::ActsAsRoom

    attr_accessor :desc    

  	def initialize(name,options = {})
  		@name = name
  	end

  end

 end