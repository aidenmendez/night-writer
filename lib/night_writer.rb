require './lib/controller'

user_input = ARGV
controller = Controller.new(user_input)

puts controller.confirm_file_creation

