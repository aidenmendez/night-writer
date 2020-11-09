require './lib/translator'

class Manager
  attr_reader :input_file_name,
              :output_file_name,
              :parent,
              :translator,
              :input_file_content

  def initialize(parent, user_input)
    @parent = parent
    @input_file_name = user_input[0]
    @output_file_name = user_input[1]
    @translator = Translator.new(self)
    @input_file_content = get_file_content(input_file_name)
  end

  def get_file_content(input_file_name)
    File.readlines(input_file_name)
  end
end