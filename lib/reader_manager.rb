require './lib/manager'
require "./lib/manager"

class ReaderManager < Manager
  def initialize(parent, user_input)
    super(parent, user_input)
    @input_file_content = @input_file_content.join.gsub("\n", "")
  end
end
