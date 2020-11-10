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
    text = ["welcome to my program! this is simply dummy text of the printing and typesetting industry. lorem ipsum has been the industry's standard dummy text ever since the old days, when an unknown printer took a galley of type and scrambled it to make a type specimen book. it has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. it was popularized in the sixties with the release of letraset sheets containing orem ipsum passages, and more recently with desktop publishing"]
    assert_equal text, @manager.get_file_content("message.txt")
  end
end