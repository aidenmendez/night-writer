require "./lib/controller"

user_input = ARGV
controller = Controller.run(user_input, "writer")
puts controller.manager.confirmation
