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
    @input_file_content = get_file_content
  end

  def get_file_content
    File.readlines(@input_file_name)
  end

  def confirm_file_created(file_name, char_count)
    "Created '#{file_name}' containing #{char_count} characters"
  end
end