require_relative "./test_helper"

class WriterManagerTest < Minitest::Test
  def setup
    @writer_manager = WriterManager.new
  end

  def test_it_exists_and_has_atttributes
    assert_instance_of WriterManager, @writer_manager 
    assert_equal [], @writer_manager.braille_rows
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

end