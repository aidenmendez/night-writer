class BrailleRow
  attr_reader :characters
  
  def initialize(characters)
    @characters = characters
    @line_1 = ""
    @line_2 = ""
    @line_3 = ""
  end
end