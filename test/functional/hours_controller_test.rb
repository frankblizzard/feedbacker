require 'test_helper'

class HoursControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Hour.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Hour.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Hour.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to hour_url(assigns(:hour))
  end

  def test_edit
    get :edit, :id => Hour.first
    assert_template 'edit'
  end

  def test_update_invalid
    Hour.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Hour.first
    assert_template 'edit'
  end

  def test_update_valid
    Hour.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Hour.first
    assert_redirected_to hour_url(assigns(:hour))
  end

  def test_destroy
    hour = Hour.first
    delete :destroy, :id => hour
    assert_redirected_to hours_url
    assert !Hour.exists?(hour.id)
  end
end
