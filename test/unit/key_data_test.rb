require 'test_helper'

class KeyDataTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert KeyData.new.valid?
  end
end
