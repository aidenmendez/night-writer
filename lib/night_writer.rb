require "./lib/controller"

user_input = ARGV
controller = Controller.run(user_input, "writer")
puts controller.confirm_file_created(controller.output_file_name, controller.writer_manager.text.length)
