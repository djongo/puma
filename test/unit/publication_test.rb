require 'test_helper'

class PublicationTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Publication.new.valid?
  end
end
