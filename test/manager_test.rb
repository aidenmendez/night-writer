require 'Minitest/autorun'
require 'Minitest/pride'
require './lib/manager'

class ManagerTest < Minitest::Test
  def setup
    locations = {
      input: "./test/fixture_files/welcome_message.txt",
      output: "./test/fixture_files/output/br_message.txt"
    }
    # [locations[:input], locations[:output]]

    @manager = Manager.new(nil, [locations[:input], locations[:output]])
  end

  def test_it_exists_and_has_attributes
    assert_instance_of Manager, @manager
  end

  def test_it_can_get_file_contents
    text = ["welcome to my program!"]
    assert_equal text, @manager.get_file_content
  end

  def test_can_confirm_file_created
    msg = "Created 'braille.txt' containing 22 characters"
    assert_equal msg, @manager.confirm_file_created("braille.txt", 22)
  end
end