require './lib/controller'

user_input = ARGV
controller = Controller.new(user_input)

controller.write_output_file(controller.input_file_content)

puts controller.confirm_file_creation

