module ElectricSheep
  module Models

    module ActsAsTadsObject

      def tad_object_name
        name.split(/\s+/).join('_').camelize(:lower) 
      end      

    end

  end

end