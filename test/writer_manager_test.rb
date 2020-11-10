require_relative "./test_helper"

class WriterManagerTest < Minitest::Test
  def setup
    locations = {
      input: "./test/fixture_files/welcome_message.txt",
      output: "./test/fixture_files/output/br_message.txt"
    }

    @writer_manager = WriterManager.new(nil, [locations[:input], locations[:output]])
  end

  def test_it_exists_and_has_atttributes
    content = "welcome to my program!"

    assert_instance_of WriterManager, @writer_manager 
    assert_equal content, @writer_manager.input_file_content
    assert_instance_of Translator, @writer_manager.translator
    assert "./test/fixture_files/output/br_message.txt"
  end

  def test_it_can_get_file_content
    text = ["welcome to my program!"]
    assert_equal text, @writer_manager.get_file_content
  end

  def test_it_can_write_output_file
    output_file_name = "./test/fixture_files/output/test.txt"
    content = "welcome to my program!"
    braille = ".00.0.000.000....00...0000..000.0.000.0.00..\n00.00....0...0..00.0.....0..0.00.00000....00\n.0..0...0.0.....0.0...0.00..0.0.0...0...0.0."

    assert output_file_name, @writer_manager.write_output_file
    assert_equal braille, File.read(output_file_name)
  end

  def test_create_braille_rows
    File.expects(:readlines).returns(["hello world"])
    test_manager = WriterManager.new(nil, ["message.txt", "braille.txt"])

    assert_instance_of BrailleRow, test_manager.braille_rows[0]
    assert_equal "hello world", test_manager.braille_rows[0].characters
  end

  def test_create_braille_rows_with_longer_string
    File.expects(:readlines).returns(["hello world, this is a string that is longer than forty characters!"])
    test_manager = WriterManager.new(nil, ["message.txt", "braille.txt"])
    
    assert_equal 2, test_manager.braille_rows.length
  end

  def test_translate_char
    assert_equal [".0", "00", ".0"], @writer_manager.translate_char("w")
  end

  def test_print_lines_when_one_braille_row
    all_lines = [".0","00", ".0"]
    braille = ".0\n00\n.0"

    file = File.open("./test/fixture_files/output/test_print_single_braille_row.txt", "w")
    @writer_manager.print_lines(file, all_lines)
    file.close

    assert_equal braille, File.read("./test/fixture_files/output/test_print_single_braille_row.txt")
  end

  def test_print_lines_when_multiple_braille_rows
    all_lines = [".0","00",".0","0.","00","..","00",".0", "00"] #vertical www
    braille = ".0\n00\n.0\n0.\n00\n..\n00\n.0\n00"

    file = File.open("./test/fixture_files/output/test_two_short_braille_rows.txt", "w")
    @writer_manager.print_lines(file, all_lines)
    file.close

    assert_equal braille, File.read("./test/fixture_files/output/test_two_short_braille_rows.txt")
  end

  def test_can_confirm_file_created
    msg = "Created 'braille.txt' containing 22 characters"
    assert_equal msg, @writer_manager.confirm_file_created("braille.txt", 22)

    msg = "Created './test/fixture_files/output/br_message.txt' containing 22 characters"
    assert_equal msg, @writer_manager.confirmation
  end
end