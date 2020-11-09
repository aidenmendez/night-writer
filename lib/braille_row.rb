class BrailleRow
  attr_reader :characters,
              :line_1,
              :line_2,
              :line_3

  def self.get_lines(rows)
    rows.flat_map do |row|
      [row.line_1, row.line_2, row.line_3]
    end
  end

  def initialize(parent, characters)
    @parent = parent
    @characters = characters
    @line_1 = ""
    @line_2 = ""
    @line_3 = ""
    build_lines(@characters)
  end

  def build_lines(characters)
    chars = characters.scan(/.{1,1}/)
    chars.each do |char|
      braille_arr = translate_char(char)
      concat_lines(braille_arr)
    end
  end

  def translate_char(char)
    @parent.translate_char(char)
  end

  def concat_lines(braille_arr)
    @line_1 << braille_arr[0]
    @line_2 << braille_arr[1]
    @line_3 << braille_arr[2]
  end
end