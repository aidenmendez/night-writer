require "./lib/braille_row"

class WriterManager
  attr_reader :braille_rows,
              :translator,
              :text

  def initialize(parent, input_file_name)
    @parent = parent
    @translator = Translator.new(self)
    @text = get_file_content(input_file_name)
    @braille_rows = []
    braille_row_gen(@text)
  end

  def get_file_content(file_name)
    File.readlines(file_name)[0]
  end

  def write_output_file(content, file_name)
    all_lines = BrailleRow.get_lines(@braille_rows)
    
    file = File.open(file_name, "w")
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

  def braille_row_gen(text)
    chunks = text.scan(/.{1,40}/)

    chunks.each do |chunk|
      @braille_rows << BrailleRow.new(self, chunk)
    end
  end

  def translate_char(char)
    translator.keys[char]
  end
end
