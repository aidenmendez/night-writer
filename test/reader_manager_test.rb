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

  def test_it_can_get_translation_keys
    keys = [
      [".0", "00", ".0"], ["0.", ".0", ".."], 
      ["0.", "0.", "0."], ["00", "..", ".."],
      ["0.", ".0", "0."], ["00", "..", "0."], 
      ["0.", ".0", ".."], ["..", "..", ".."], 
      [".0", "00", "0."], ["0.", ".0", "0."], 
      ["..", "..", ".."], ["00", "..", "0."], 
      ["00", ".0", "00"], ["..", "..", ".."], 
      ["00", "0.", "0."], ["0.", "00", "0."], 
      ["0.", ".0", "0."], ["00", "00", ".."], 
      ["0.", "00", "0."], ["0.", "..", ".."], 
      ["00", "..", "0."], ["..", "00", "0."]]

    assert_equal keys, @reader_manager.create_translation_keys(@reader_manager.input_file_content)
  end

  def test_it_can_translate_keys
    keys = [
      [".0", "00", ".0"], ["0.", ".0", ".."], 
      ["0.", "0.", "0."], ["00", "..", ".."],
      ["0.", ".0", "0."], ["00", "..", "0."], 
      ["0.", ".0", ".."], ["..", "..", ".."], 
      [".0", "00", "0."], ["0.", ".0", "0."], 
      ["..", "..", ".."], ["00", "..", "0."], 
      ["00", ".0", "00"], ["..", "..", ".."]
    ]

    assert_equal "welcome to my ", @reader_manager.translate_keys(keys)
  end

  def test_it_can_slice_braille_array_into_rows
    single_row =  [".00.0.000.000....00...0000..000.0.000.0.00..\n", "00.00....0...0..00.0.....0..0.00.00000....00\n", ".0..0...0.0.....0.0...0.00..0.0.0...0...0.0."]

    assert_equal [single_row], @reader_manager.slice_into_rows(single_row)
  end

  def test_collect_translation_keys
    skip
    single_row =  [".00.0.000.000....00...0000..000.0.000.0.00..\n", "00.00....0...0..00.0.....0..0.00.00000....00\n", ".0..0...0.0.....0.0...0.00..0.0.0...0...0.0."]
    require 'pry'; binding.pry
    assert_equal [], @reader_manager.collect_translation_keys(single_row)
  end

  def test_it_can_write_output_file
    output_file_name = "reader_test.txt"
    english = "welcome to my program!"
    content = ".00.0.000.000....00...0000..000.0.000.0.00..\n00.00....0...0..00.0.....0..0.00.00000....00\n.0..0...0.0.....0.0...0.00..0.0.0...0...0.0."

    assert output_file_name, @reader_manager.write_output_file(output_file_name)
    assert_equal english, File.read(output_file_name)
  end

  def test_all_characters_zzz
    
    all_chars = " !',-.?abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
    new_locations = {
      input: "./test/fixture_files/all_characters_braille.txt",
      output: "./test/fixture_files/output/output_all_chars_eng.txt"
    }
   
    reader_manager_all = ReaderManager.new(nil, [new_locations[:input], new_locations[:output]])
    
    assert locations[:output]
    assert_equal all_chars, File.readlines(locations[:output])
  end
end
