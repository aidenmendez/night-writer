require 'Minitest/autorun'
require 'Minitest/pride'
require './lib/manager'

class ManagerTest < Minitest::Test
  def setup
    locations = {
      input: "./test/fixture_files/message.txt",
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
    assert_equal text, @manager.get_file_content("message.txt")
  end
end