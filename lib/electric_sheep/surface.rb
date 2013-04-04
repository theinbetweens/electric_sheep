module ElectricSheep
  
  class Surface

    include Models::ActsAsSurface

    attr_accessor :name, :nouns, :location

    def initialize(name,options = {})
      @name = name
      @nouns ||= []
    end

  end

 end