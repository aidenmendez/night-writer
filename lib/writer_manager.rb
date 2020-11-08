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
    file = File.open(file_name, "w")
    file.write(content)
    file.close
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