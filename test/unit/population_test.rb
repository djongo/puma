require 'test_helper'

class PopulationTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Population.new.valid?
  end
end
