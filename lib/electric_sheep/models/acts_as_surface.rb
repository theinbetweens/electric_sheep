module ElectricSheep
  module Models

    module ActsAsSurface

      def self.included klass
        klass.class_eval do
          include ActsAsTadsObject
        end
      end         

      def write
        output = []
        output << tad_object_name+': Surface'
        output << '  noun = '+nouns.collect {|x| %Q{'#{x}'}}.join(' ') unless nouns.empty?  
        output << '  location = '+location.tad_object_name unless location.nil?
        output << ";"
        output.join("\n")        
      end

    end
  end
end