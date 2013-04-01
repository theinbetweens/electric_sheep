module ElectricSheep
  module Models

    module ActsAsRoom
      #extend ActiveSupport::Concern

      #attr_accessor :desc

      def write
        output = []
        output << "#{tad_object_name}: Room '#{name}'"
        output << %Q{  "#{desc}"}
        output << ";"
        output.join("\n")
      end

      def tad_object_name
        name.split(/\s+/).join('_').camelize(:lower) 
      end

    end

  end
end