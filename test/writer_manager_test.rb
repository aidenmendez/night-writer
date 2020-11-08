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
    text = "lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris facilisis lorem lectus, vel interdum lorem imperdiet quis. Proin aliquam urna eu leo mollis, et laoreet lorem viverra. Vivamus blandit enim ipsum, nec luctus risus maximus vel. In sed mi odiom test"
    assert_equal text, @writer_manager.get_file_content("message.txt")
  end

end