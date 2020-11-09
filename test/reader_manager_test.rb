require 'Minitest/autorun'
require 'Minitest/pride'
require './lib/reader_manager'
require './lib/controller'

class ReaderManagerTest < Minitest::Test
  def setup
    locations = {
      input: "./test/fixture_files/braille.txt",
      output: "./test/fixture_files/output/en_message.txt"
    }
    @controller = Controller.new([locations[:input], locations[:output]], "reader")
    @reader_manager = controller.manager
  end

  def test_it_exists
    assert_instance_of ReaderManager, @reader_manager
  end
end