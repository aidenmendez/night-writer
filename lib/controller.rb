class Controller
  attr_reader :input_file_name, :output_file_name , :input_file_content
  
  def initialize(user_input)
    @input_file_name = user_input[0]
    @output_file_name = user_input[1]
    @input_file_content = get_file_content(input_file_name)
  end

  def confirm_file_creation
    "Created '#{@output_file_name}' containing #{input_file_content.length} characters"
  end

  def get_file_content(file_name)
    File.readlines(file_name)[0]
  end

  def write_output_file(content)
    file = File.open(output_file_name, "w")
    file.write(content)
    file.close
  end
end