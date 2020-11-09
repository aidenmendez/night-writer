require_relative "./test_helper"

class ControllerTest < Minitest::Test
  def setup
    @controller = Controller.new(["message.txt", "braille.txt"], "writer")
  end

  def test_it_exists
    assert_instance_of Controller, @controller
  end

  def test_it_has_attributes
    assert_equal "message.txt", @controller.input_file_name
    assert_equal "braille.txt", @controller.output_file_name
    assert_equal "writer", @controller.function
    assert_instance_of WriterManager, @controller.manager
  end

  def test_can_confirm_file_created
    msg = "Created 'braille.txt' containing 22 characters"
    assert_equal msg, @controller.confirm_file_created("braille.txt", 22)
  end

  def test_it_has_input_file_content_attribute
    text = "welcome to my program!"
    assert_equal text, @controller.input_file_content
  end

  def test_it_can_get_file_content
    text = "welcome to my program!"
    assert_equal text, @controller.get_file_content
  end

  def test_it_can_write_output_file
    assert "braille.txt", @controller.write_output_file
    text = ".00.0.000.000....00...0000..000.0.000.0.00..\n00.00....0...0..00.0.....0..0.00.00000....00\n.0..0...0.0.....0.0...0.00..0.0.0...0...0.0."
    assert_equal text, File.read("braille.txt")
    # assert_equal "Created 'braille.txt' containing  characters"
  end

  def test_run_class_method
    Controller.expects(:confirm_user_input).returns(true)
    new_controller = Controller.run(["message.txt", "long_braille.txt"], "writer")

    assert_instance_of Controller, new_controller
  end

  def test_file_created
    assert_equal "Created 'new_file' containing 40 characters", @controller.confirm_file_created("new_file", 40)
  end
end
 