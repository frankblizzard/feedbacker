require 'test_helper'

class HourTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Hour.new.valid?
  end
end
