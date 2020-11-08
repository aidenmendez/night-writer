require_relative "./test_helper"

class WriterManagerTest < Minitest::Test
  def setup
    @writer_manager = WriterManager.new
  end

  def test_it_exists_and_has_atttributes
    assert_instance_of WriterManager, @writer_manager 
    assert_equal [], @writer_manager.braille_rows
  end

end