require 'test_helper'

class PublicationTypeTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert PublicationType.new.valid?
  end
end
