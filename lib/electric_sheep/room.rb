module ElectricSheep
  
  class Room

    include Models::ActsAsRoom

    attr_accessor :desc, :name, :north, :south, :west, :east    

  	def initialize(name,options = {})
  		@name = name
  	end

  end

 end