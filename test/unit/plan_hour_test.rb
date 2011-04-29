require 'test_helper'

class PlanHourTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert PlanHour.new.valid?
  end
end
