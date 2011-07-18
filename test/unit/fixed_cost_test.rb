require 'test_helper'

class FixedCostTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert FixedCost.new.valid?
  end
end
