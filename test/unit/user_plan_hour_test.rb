require 'test_helper'

class UserPlanHourTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert UserPlanHour.new.valid?
  end
end
