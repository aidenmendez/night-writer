require_relative "./test_helper"

class BrailleRowTest < Minitest::Test
  def setup
    sample_text = "w" #elcome to my program!
    @braille_row = BrailleRow.new(sample_text)
  end

  def test_it_exists_and_has_attributes
    assert_instance_of BrailleRow, @braille_row
    assert_equal "w", @braille_row.characters
  end
end