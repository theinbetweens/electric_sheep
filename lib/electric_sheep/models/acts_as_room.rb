module ElectricSheep
  module Models

    module ActsAsRoom
      #extend ActiveSupport::Concern

      #attr_accessor :desc

      def write
        output = []
        output << "#{tad_object_name}: Room '#{name}'"
        if any_rooms_connected?
          output << %Q{  desc = "#{desc}"}
          unless north.nil?
            output << %Q{  north = #{north.tad_object_name}}
          end
        else
          output << %Q{  "#{desc}"}
        end
        output << ";"
        output.join("\n")
      end

      def any_rooms_connected?
        ![north,south,east,west].all?(&:nil?)
      end

      def tad_object_name
        name.split(/\s+/).join('_').camelize(:lower) 
      end

    end

  end
end