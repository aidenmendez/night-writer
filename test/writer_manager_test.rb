require_relative "./test_helper"

class WriterManagerTest < Minitest::Test
  def setup
    @controller = Controller.new(["message.txt", "braille.txt"])
    @writer_manager = @controller.writer_manager
  end

  def test_it_exists_and_has_atttributes
    text = "welcome to my program!"

    assert_instance_of WriterManager, @writer_manager 
    assert_equal [], @writer_manager.braille_rows
    assert_equal text, @writer_manager.text
  end

  def test_it_can_get_file_contents
    text = "welcome to my program!"
    assert_equal text, @writer_manager.get_file_content("message.txt")
  end

  def test_it_can_write_output_file
    new_file = "test.txt"
    content = "welcome to my program!"
    assert new_file, @writer_manager.write_output_file(content, new_file)
    assert_equal "welcome to my program!", File.read(new_file)
  end

  def test_braille_row_gen
    @writer_manager.braille_row_gen("hello world")

    assert_instance_of BrailleRow, @writer_manager.braille_rows[0]
  end

  def test_braille_row_gen_with_longer_string
    @writer_manager.braille_row_gen("hello world, this is a string that is longer than forty characters!")

    assert_equal 2, @writer_manager.braille_rows.length
  end
end