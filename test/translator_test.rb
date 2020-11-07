require_relative "./test_helper"

class TranslatorTest < Minitest::Test
  def setup
    @translator = Translator.new
  end
  
  def test_it_exists	
    assert_instance_of Translator, @translator 
  end
end