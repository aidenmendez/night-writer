require_relative "./test_helper"

class BrailleRowTest < Minitest::Test
  def setup
    sample_text = "w" #elcome to my program!
    @braille_row = BrailleRow.new(sample_text)
  end

  def test_it_exists	
    assert_instance_of BrailleRow, @braille_row 
  end
end