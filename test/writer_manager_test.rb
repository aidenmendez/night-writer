require_relative "./test_helper"

class WriterManagerTest < Minitest::Test
  def setup
    @writer_manager = WriterManager.new
  end

  def test_it_exists	
    assert_instance_of WriterManager, @writer_manager 
  end
end