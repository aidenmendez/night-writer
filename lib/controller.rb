require "./lib/writer_manager"
require "./lib/reader_manager"
require "./lib/translator"
require "./lib/braille_row"

class Controller
  attr_reader :input_file_name,
              :output_file_name,
              :input_file_content,
              :manager,
              :function

  def self.run(user_input, function)
    new(user_input, function)
  end
              
  def initialize(user_input, function)
    @function = function
    @input_file_name = user_input[0]
    @output_file_name = user_input[1]
    @manager = create_manager(user_input, function)
    @input_file_content = get_file_content
    write_output_file
  end

  def create_manager(user_input, function)
    if function == "writer"
      WriterManager.new(self, user_input)
    elsif function == "reader"
      ReaderManager.new(self, user_input)
    end
  end

  def get_file_content
    @manager.get_file_content(input_file_name)
  end

  def write_output_file
    @manager.write_output_file(output_file_name)
  end

  def confirm_file_created(output_file, char_count)
    "Created '#{output_file}' containing #{char_count} characters"
  end
end
