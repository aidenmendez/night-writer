class Controller
  attr_reader :input_file, :output_file 
  
  def initialize(user_input)
    @input_file = user_input[0]
    @output_file = user_input[1]
  end

  def confirm_file_creation
    "Created 'braille.txt' containing 256 characters"
  end
end