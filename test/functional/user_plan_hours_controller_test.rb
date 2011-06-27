require 'test_helper'

class UserPlanHoursControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => UserPlanHour.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    UserPlanHour.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    UserPlanHour.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to user_plan_hour_url(assigns(:user_plan_hour))
  end

  def test_edit
    get :edit, :id => UserPlanHour.first
    assert_template 'edit'
  end

  def test_update_invalid
    UserPlanHour.any_instance.stubs(:valid?).returns(false)
    put :update, :id => UserPlanHour.first
    assert_template 'edit'
  end

  def test_update_valid
    UserPlanHour.any_instance.stubs(:valid?).returns(true)
    put :update, :id => UserPlanHour.first
    assert_redirected_to user_plan_hour_url(assigns(:user_plan_hour))
  end

  def test_destroy
    user_plan_hour = UserPlanHour.first
    delete :destroy, :id => user_plan_hour
    assert_redirected_to user_plan_hours_url
    assert !UserPlanHour.exists?(user_plan_hour.id)
  end
end
