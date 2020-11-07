class Controller
  #attr_reader 
  
  def initialize(user_input)
    @input_file = user_input[0]
    @output_file = user_input[1]
  end
end