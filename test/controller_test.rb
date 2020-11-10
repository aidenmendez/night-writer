require_relative "./test_helper"

class ControllerTest < Minitest::Test
  def setup
    locations = {
      input: "./test/fixture_files/welcome_message.txt",
      output: "./test/fixture_files/output/welcome_braille.txt"
    }
    @controller = Controller.run([locations[:input], locations[:output]], "writer")
  end

  def test_it_exists
    assert_instance_of Controller, @controller
  end

  def test_it_has_attributes
    assert_equal "./test/fixture_files/welcome_message.txt", @controller.input_file_name
    assert_equal "./test/fixture_files/output/welcome_braille.txt", @controller.output_file_name
    assert_equal "writer", @controller.function
    assert_instance_of WriterManager, @controller.manager
  end

  def test_it_can_instantiate_reader_manager
    locations = {
      input: "./test/fixture_files/braille.txt",
      output: "./test/fixture_files/output/reader_output.txt"
    }
    reader_controller = Controller.run([locations[:input], locations[:output]], "reader")

    assert_instance_of ReaderManager, reader_controller.manager
  end

  def test_can_confirm_file_created
    msg = "Created 'braille.txt' containing 22 characters"
    assert_equal msg, @controller.confirm_file_created("braille.txt", 22)
  end

  def test_it_has_input_file_content_attribute
    text = ["welcome to my program!"]
    assert_equal text, @controller.input_file_content
  end

  def test_it_can_get_file_content
    text = ["welcome to my program!"]
    assert_equal text, @controller.get_file_content
  end

  def test_it_can_write_output_file
    assert "welcome_braille.txt", @controller.write_output_file

    text = ".00.0.000.000....00...0000..000.0.000.0.00..\n00.00....0...0..00.0.....0..0.00.00000....00\n.0..0...0.0.....0.0...0.00..0.0.0...0...0.0."

    assert_equal text, File.read("./test/fixture_files/output/welcome_braille.txt")
  end

  def test_file_created
    assert_equal "Created 'new_file' containing 40 characters", @controller.confirm_file_created("new_file", 40)
  end
end
 