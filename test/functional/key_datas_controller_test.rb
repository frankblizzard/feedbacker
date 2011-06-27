require 'test_helper'

class KeyDatasControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => KeyData.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    KeyData.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    KeyData.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to key_data_url(assigns(:key_data))
  end

  def test_edit
    get :edit, :id => KeyData.first
    assert_template 'edit'
  end

  def test_update_invalid
    KeyData.any_instance.stubs(:valid?).returns(false)
    put :update, :id => KeyData.first
    assert_template 'edit'
  end

  def test_update_valid
    KeyData.any_instance.stubs(:valid?).returns(true)
    put :update, :id => KeyData.first
    assert_redirected_to key_data_url(assigns(:key_data))
  end

  def test_destroy
    key_data = KeyData.first
    delete :destroy, :id => key_data
    assert_redirected_to key_datas_url
    assert !KeyData.exists?(key_data.id)
  end
end
