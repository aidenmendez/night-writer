require_relative "./test_helper"

class TranslatorTest < Minitest::Test
  def setup
    @translator = Translator.new
  end

  def test_it_exists_and_has_attributes
    assert_instance_of Translator, @translator
    assert_instance of Hash, @translator.br_dictionary
  end
end