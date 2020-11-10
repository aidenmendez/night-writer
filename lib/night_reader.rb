require "./lib/controller"

user_input = ARGV
controller = Controller.run(user_input, "reader")
puts controller.manager.confirmation