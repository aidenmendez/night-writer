require_relative "./test_helper"

class BrailleRowTest < Minitest::Test
  def setup
    locations = {
      input: "./test/fixture_files/welcome_message.txt",
      output: "./test/fixture_files/output/br_message.txt"
    }
    @controller = Controller.new([locations[:input], locations[:output]], "writer")
    @braille_row = @controller.manager.braille_rows[0]
  end

  def test_it_exists_and_has_attributes
    assert_instance_of BrailleRow, @braille_row
    assert_equal "welcome to my program!", @braille_row.characters
  end

  def test_it_builds_lines
    assert_equal ".00.0.000.000....00...0000..000.0.000.0.00..", @braille_row.line_1
    assert_equal "00.00....0...0..00.0.....0..0.00.00000....00", @braille_row.line_2
    assert_equal ".0..0...0.0.....0.0...0.00..0.0.0...0...0.0.", @braille_row.line_3
  end

  def test_translate_char
    assert_equal [".0", "00", ".0"],  @braille_row.translate_char("w")
  end

  def test_concat_lines
    empty_row = BrailleRow.new(nil, "")
    
    empty_row.concat_lines([".0", "00", ".0"]) #w

    assert_equal ".0", empty_row.line_1
    assert_equal "00", empty_row.line_2
    assert_equal ".0", empty_row.line_3
  end

  def test_get_lines
    mock_parent = mock
    mock_parent.stubs(:translate_char).returns(["00", "..", "00"])
    row_1 = BrailleRow.new(mock_parent, "x")
    row_2 = BrailleRow.new(mock_parent, "x")
    rows = [row_1, row_2]

    lines = BrailleRow.get_lines(rows)

    assert_equal ["00", "..", "00", "00", "..", "00"], lines
  end
end