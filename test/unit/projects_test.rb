require 'test_helper'

class ProjectsTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Projects.new.valid?
  end
end
