require "./lib/controller"

user_input = ARGV
controller = Controller.run(user_input, "writer")
puts controller.confirm_file_created(controller.manager.output_file_name, controller.manager.input_file_content.length)
