require "./lib/responder"
require "./lib/writer_manager"

class Controller
  attr_reader :input_file_name, :output_file_name, :input_file_content

  def initialize(user_input)
    @input_file_name = user_input[0]
    @output_file_name = user_input[1]
    @responder = Responder.new
    @writer_manager = WriterManager.new
    @input_file_content = get_file_content
  end

  def confirm_file_created
   @responder.confirm_file_created(@output_file_name, @input_file_content.length)
  end

  def get_file_content
    @writer_manager.get_file_content(input_file_name)
  end

  def write_output_file(content)
    file = File.open(output_file_name, "w")
    file.write(content)
    file.close
  end
end
