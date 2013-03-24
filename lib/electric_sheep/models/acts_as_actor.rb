module ElectricSheep
  module Models

    module ActsAsActor

      def write
       # %Q{
      #   #{@name}: Actor
      #     location = firstRoom
      #   ;      
      #  }
        output = []
        output << "#{name}: Actor"
        output << %Q{  location = firstRoom}
        output << ";"
        output.join("\n")
      end

    end

  end

end