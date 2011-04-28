require 'test_helper'

class ChatMessagesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => ChatMessage.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    ChatMessage.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    ChatMessage.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to chat_message_url(assigns(:chat_message))
  end

  def test_edit
    get :edit, :id => ChatMessage.first
    assert_template 'edit'
  end

  def test_update_invalid
    ChatMessage.any_instance.stubs(:valid?).returns(false)
    put :update, :id => ChatMessage.first
    assert_template 'edit'
  end

  def test_update_valid
    ChatMessage.any_instance.stubs(:valid?).returns(true)
    put :update, :id => ChatMessage.first
    assert_redirected_to chat_message_url(assigns(:chat_message))
  end

  def test_destroy
    chat_message = ChatMessage.first
    delete :destroy, :id => chat_message
    assert_redirected_to chat_messages_url
    assert !ChatMessage.exists?(chat_message.id)
  end
end
