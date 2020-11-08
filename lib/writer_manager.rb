class WriterManager
  attr_reader :braille_rows

  def initialize
    @braille_rows = []
  end

  def get_file_content(file_name)
    File.readlines(file_name)[0]
  end

  def write_output_file(content, file_name)
    file = File.open(file_name, "w")
    file.write(content)
    file.close
  end
end