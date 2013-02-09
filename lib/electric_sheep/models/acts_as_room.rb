module ElectricSheep
  module Models

    module ActsAsRoom
      #extend ActiveSupport::Concern

      attr_accessor :desc

      def write
        output = []
        output << "firstRoom: Room '#{@name}'"
        output << %Q{  "#{desc}"}
        output << ";"
        output.join("\n")
      end

    end

  end
end