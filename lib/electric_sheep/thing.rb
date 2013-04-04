module ElectricSheep

  class Thing

    include Models::ActsAsThing

    attr_reader :name
    attr_accessor :nouns, :adjectives, :location

    def initialize(name)
      @name = name
      @nouns ||= []
      @adjectives ||= []
    end

  end

end