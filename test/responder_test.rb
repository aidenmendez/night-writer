require_relative "./test_helper"

class ResponderTest < Minitest::Test
  def setup
    @responder = Responder.new
  end

  def test_it_exists	
    assert_instance_of Responder, @responder 
  end
end