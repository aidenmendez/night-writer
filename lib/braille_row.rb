class BrailleRow
  attr_reader :characters,
              :line_1,
              :line_2,
              :qqqline_3

  def initialize(parent, characters)
    @parent = parent
    @characters = characters
    @line_1 = ""
    @line_2 = ""
    @line_3 = ""
  end

  def build_lines(characters)
    chars = characters.scan(/.{1,1}/)
  end

  def translate_char(char)
    @parent.translate_char(char)
  end
end