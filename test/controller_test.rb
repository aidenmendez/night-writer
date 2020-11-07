require 'Minitest/autorun'
require 'Minitest/pride'
require './lib/controller'

class ControllerTest < Minitest::Test
  def setup
    @controller = Controller.new(["message.txt", "braille.txt"])
  end

  def test_it_exists	
    assert_instance_of Controller, @controller
  end

  def test_it_returns_a_message
    msg = "Created 'braille.txt' containing 256 characters"
    assert_equal msg, @controller.respond_to_user
  end
  
end