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

  def test_create_manager
    assert_instance_of WriterManager, @controller.manager

    locations = {
      input: "./test/fixture_files/short_braille_sample.txt",
      output: "./test/fixture_files/output/eng_message.txt"
    }

    reader_controller = Controller.run([locations[:input], locations[:output]], "reader")

    assert_instance_of ReaderManager, reader_controller.manager
  end
end
 