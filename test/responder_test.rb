require_relative "./test_helper"

class ResponderTest < Minitest::Test
  def setup
    @responder = Responder.new
  end

  def test_it_exists	
    assert_instance_of Responder, @responder 
  end

  def test_it_returns_confirmation_message
    msg = "Created 'braille.txt' containing 261 characters"
    assert_equal msg, @responder.confirm_file_created("braille.txt", 261)
  end
end