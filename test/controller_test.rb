require 'Minitest/autorun'
require 'Minitest/pride'
require './lib/controller'

class ControllerTest < Minitest::Test
  def setup
    @controller = Controller.new
  end

  def test_it_exists	
    assert_instance_of Controller, @controller
  end
end