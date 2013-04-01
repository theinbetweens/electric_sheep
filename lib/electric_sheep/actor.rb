module ElectricSheep

  class Actor

    attr_accessor :location, :name

    include Models::ActsAsActor

  	def initialize(name)
  		@name = name
  	end

  end

end