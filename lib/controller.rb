require "./lib/writer_manager"
require "./lib/translator"
require "./lib/braille_row"

class Controller
  attr_reader :input_file_name,
              :output_file_name,
              :input_file_content,
              :writer_manager

  def self.run(user_input, function)
    if confirm_user_input(user_input)
      new(user_input)
    end
  end

  def self.confirm_user_input(user_input, function)
    if user_input.length != 2
      puts "Wrong number of arguments. Try again"
      exit
    elsif !File.exist?(user_input[0])
      puts "The file #{user_input[0]} doesn't exist. Try again"
      exit
    elsif user_input[0][-4..-1] != ".txt" || user_input[1][-4..-1] != ".txt"
      puts "File names must end with the .txt extension. Try again"
      exit
    else
      true
    end
  end
              
  def initialize(user_input)
    @input_file_name = user_input[0]
    @output_file_name = user_input[1]
    @writer_manager = WriterManager.new(self, @input_file_name)
    @input_file_content = get_file_content
    write_output_file
  end

  def get_file_content
    @writer_manager.get_file_content(input_file_name)
  end

  def write_output_file
    @writer_manager.write_output_file(input_file_content, output_file_name)
  end

  def confirm_file_created(output_file, char_count)
    "Created '#{output_file}' containing #{char_count} characters"
  end
end
