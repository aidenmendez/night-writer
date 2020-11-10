require 'Minitest/autorun'
require 'Minitest/pride'
require './lib/reader_manager'
require './lib/controller'

class ReaderManagerTest < Minitest::Test
  def setup
    locations = {
      input: "./test/fixture_files/short_braille_sample.txt",
      output: "./test/fixture_files/output/eng_message.txt"
    }

    @reader_manager = ReaderManager.new(nil, [locations[:input], locations[:output]])
  end

  def test_it_exists
    assert_instance_of ReaderManager, @reader_manager
  end

  def test_it_inherits_attributes
    braille = [".00.0.000.000....00...0000..000.0.000.0.00..\n", "00.00....0...0..00.0.....0..0.00.00000....00\n", ".0..0...0.0.....0.0...0.00..0.0.0...0...0.0."]

    assert_equal "./test/fixture_files/short_braille_sample.txt",  @reader_manager.input_file_name
    assert_equal "./test/fixture_files/output/eng_message.txt",  @reader_manager.output_file_name
    assert_instance_of Translator, @reader_manager.translator
    assert_equal braille, @reader_manager.input_file_content
  end

  def test_it_can_convert_braille_to_english
    @reader_manager.convert_to_english(@reader_manager.input_file_content)
  end

  def test_it_can_translate_a_row
    @reader_manager.translate_row(@reader_manager.input_file_content)
  end
end