require './lib/translator'

class Manager
  def initialize(parent, input_file_name)
    @parent = parent
    @input_file_name = input_file_name
    @translator = Translator.new(self)
    @text = get_file_content(input_file_name)
  end

  def get_file_content(input_file_name)
    File.readlines(input_file_name)[0]
  end
end