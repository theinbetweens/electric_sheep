module ElectricSheep
  
  class Builder
    
    def self.interpret(file_name)
      %q{
      cave: room
        sdesc = "Cave"
        ldesc = "You're inside a dark and musty cave. Sunlight
        pours in from a passage to the south. "
        south = startroom
      ;
      }.unindent
    end
    
  end
  
end