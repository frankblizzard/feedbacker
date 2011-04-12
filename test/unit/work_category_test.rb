require 'test_helper'

class WorkCategoryTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert WorkCategory.new.valid?
  end
end
