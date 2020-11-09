require 'Minitest/autorun'
require 'Minitest/pride'
require './lib/manager.rb'

class ManagerTest < Minitest::Test
  def setup
    locations = {
      input: "./test/fixture_files/message.txt",
      output: "./test/fixture_files/output/br_message.txt"
    }
    @manager = Manager.new(nil, [locations[:input], locations[:output]])
  end

  def test_it_exists
    assert_instance_of Manager, @manager
  end
end