require_relative "./test_helper"

class TranslatorTest < Minitest::Test
  def setup
    @translator = Translator.new
  end

  def test_it_exists_and_has_attributes
    assert_instance_of Translator, @translator
    assert_instance_of Hash, @translator.keys
  end

  def test_gen_keys
    a = ["0.", "..", ".."]
    p = ["00", "0.", "0."]
    
    keys = @translator.gen_keys

    assert_equal a, keys["a"]
  end
end