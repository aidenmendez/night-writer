require 'Minitest/autorun'
require 'Minitest/pride'
require './lib/manager.rb'

class ManagerTest < Minitest::Test
  def setup
    @manager = Manager.new(parent, input_file)
  end

  def test_it_exists
    assert_instance_of Manager, @manager
  end
end