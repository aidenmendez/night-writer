require "./lib/braille_row"
require "./lib/manager"

class WriterManager < Manager
  attr_reader :braille_rows,
              :input_file_content,
              :confirmation

  def initialize(parent, user_input)
    super(parent, user_input)
    @input_file_content = input_file_content[0]
    @braille_rows = []
    create_braille_rows(input_file_content)
    write_output_file
    @confirmation = confirm_file_created(@output_file_name, @input_file_content.length)
  end

  def write_output_file
    all_lines = BrailleRow.get_lines(@braille_rows)
    
    file = File.open(@output_file_name, "w")
    print_lines(file, all_lines)
    file.close
  end

  def print_lines(file, all_lines)
    braille= ""
    all_lines.each do |line|
      braille << (line + "\n")
    end
    file.write(braille.strip)
  end

  def create_braille_rows(text)
    chunks = text.scan(/.{1,40}/)

    chunks.each do |chunk|
      @braille_rows << BrailleRow.new(self, chunk)
    end
  end

  def translate_char(char)
    translator.keys[char]
  end
end
