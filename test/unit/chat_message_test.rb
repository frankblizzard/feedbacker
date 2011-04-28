require 'test_helper'

class ChatMessageTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert ChatMessage.new.valid?
  end
end
