require_relative "./test_helper"

class WriterManagerTest < Minitest::Test
  def setup
    @controller = Controller.new(["message.txt", "braille.txt"])
    @writer_manager = @controller.writer_manager
  end

  def test_it_exists_and_has_atttributes
    text = "welcome to my program!"

    assert_instance_of WriterManager, @writer_manager 
    assert_equal text, @writer_manager.text
    assert_instance_of Translator, @writer_manager.translator
  end

  def test_it_can_get_file_contents
    text = "welcome to my program!"
    assert_equal text, @writer_manager.get_file_content("message.txt")
  end

  def test_it_can_write_output_file
    new_file = "test.txt"
    content = "welcome to my program!"
    braille = ".00.0.000.000....00...0000..000.0.000.0.00..\n00.00....0...0..00.0.....0..0.00.00000....00\n.0..0...0.0.....0.0...0.00..0.0.0...0...0.0."

    assert new_file, @writer_manager.write_output_file(content, new_file)
    assert_equal braille, File.read(new_file)
  end

  def test_braille_row_gen
    @writer_manager.braille_row_gen("hello world")

    assert_instance_of BrailleRow, @writer_manager.braille_rows[0]
  end

  def test_braille_row_gen_with_longer_string
    parent = mock("mock_controller_parent")
    file_name = mock("fake_file")

    File.expects(:readlines).returns(["hello world, this is a string that is longer than forty characters!"])
    test_manager = WriterManager.new(parent, file_name)
    
    assert_equal 2, test_manager.braille_rows.length
  end

  def test_translate_char
    assert_equal [".0", "00", ".0"], @writer_manager.translate_char("w")
  end

  def test_print_lines
    all_lines = [".0","00", ".0"]
    braille = ".0\n00\n.0"

    file = File.open("braille.txt", "w")
    @writer_manager.print_lines(file, all_lines)
    file.close

    assert_equal braille, File.read("braille.txt")
  end

  def test_print_lines_when_there_are_multiple_rows_zzz
    all_lines = [".0","00",".0","0.","00","..","00",".0", "00"] #www
    braille = ".0\n00\n.0\n0.\n00\n..\n00\n.0\n00"

    file = File.open("braille.txt", "w")
    @writer_manager.print_lines(file, all_lines)
    file.close

    assert_equal braille, File.read("braille.txt")
  end
end