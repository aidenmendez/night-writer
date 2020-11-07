class Controller
  attr_reader :input_file_name, :output_file_name 
  
  def initialize(user_input)
    @input_file_name = user_input[0]
    @output_file_name = user_input[1]
  end

  def confirm_file_creation
    "Created '#{@output_file_name}' containing 256 characters"
  end

  def read_in_file(input)
    input_text = File.readlines(input)
    input_text[0]
  end
end