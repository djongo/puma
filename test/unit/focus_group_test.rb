require 'test_helper'

class FocusGroupTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert FocusGroup.new.valid?
  end
end
