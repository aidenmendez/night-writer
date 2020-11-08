require "./lib/responder"
require "./lib/writer_manager"

class Controller
  attr_reader :input_file_name,
              :output_file_name,
              :input_file_content,
              :responder,
              :translator,
              :writer_manager

  def initialize(user_input)
    @input_file_name = user_input[0]
    @output_file_name = user_input[1]
    @responder = Responder.new
    @translator = Translator.new(self)
    @writer_manager = WriterManager.new(self, @input_file_name)
    @input_file_content = get_file_content
  end

  def confirm_file_created
   @responder.confirm_file_created(@output_file_name, @input_file_content.length)
  end

  def get_file_content
    @writer_manager.get_file_content(input_file_name)
  end

  def write_output_file
    @writer_manager.write_output_file(input_file_content, output_file_name)
  end
end
