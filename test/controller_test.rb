require 'Minitest/autorun'
require 'Minitest/pride'
require 'mocha/minitest'
require './lib/controller'

class ControllerTest < Minitest::Test
  def setup
    @controller = Controller.new(["message.txt", "braille.txt"])
  end

  def test_it_exists	
    assert_instance_of Controller, @controller
  end

  def test_it_has_attr_readers
    assert_equal "message.txt", @controller.input_file_name
    assert_equal "braille.txt", @controller.output_file_name
  end

  def test_it_returns_a_message
    msg = "Created 'braille.txt' containing 261 characters"
    assert_equal msg, @controller.confirm_file_creation
  end

  def test_it_can_read_in_text_file
    text = "lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris facilisis lorem lectus, vel interdum lorem imperdiet quis. Proin aliquam urna eu leo mollis, et laoreet lorem viverra. Vivamus blandit enim ipsum, nec luctus risus maximus vel. In sed mi odiom test"
    assert_equal text, @controller.input_file_content
  end

  def test_it_can_generate_new_file
    assert_instance_of File, @controller.output_file

  end
end