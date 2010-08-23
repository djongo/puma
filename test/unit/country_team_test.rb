require 'test_helper'

class CountryTeamTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert CountryTeam.new.valid?
  end
end
