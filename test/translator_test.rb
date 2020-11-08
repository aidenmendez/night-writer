require_relative "./test_helper"

class TranslatorTest < Minitest::Test
  def setup
    @controller = Controller.new(["message.txt", "braille.txt"])
    @translator = @controller.translator
  end

  def test_it_exists
    assert_instance_of Translator, @translator
    assert_instance_of Hash, @translator.keys
  end

  def test_keys_values
    a = ["0.", "..", ".."]
    p = ["00", "0.", "0."]

    assert_equal a, @translator.keys["a"]
    assert_equal p, @translator.keys["p"]
  end
end