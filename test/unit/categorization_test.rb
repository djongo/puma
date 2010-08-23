require 'test_helper'

class CategorizationTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Categorization.new.valid?
  end
end
