require 'test_helper'

class VariableTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Variable.new.valid?
  end
end
