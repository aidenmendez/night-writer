require "./lib/writer_manager"
require "./lib/reader_manager"
require "./lib/translator"
require "./lib/braille_row"

class Controller
  attr_reader :manager,
              :function

  def self.run(user_input, function)
    new(user_input, function)
  end
              
  def initialize(user_input, function)
    @function = function
    @manager = create_manager(user_input, function)
    write_output_file
  end

  def create_manager(user_input, function)
    if function == "writer"
      WriterManager.new(self, user_input)
    elsif function == "reader"
      ReaderManager.new(self, user_input)
    end
  end

  def write_output_file
    @manager.write_output_file
  end
end
