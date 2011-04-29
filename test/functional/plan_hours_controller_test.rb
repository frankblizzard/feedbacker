require 'test_helper'

class PlanHoursControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => PlanHour.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    PlanHour.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    PlanHour.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to plan_hour_url(assigns(:plan_hour))
  end

  def test_edit
    get :edit, :id => PlanHour.first
    assert_template 'edit'
  end

  def test_update_invalid
    PlanHour.any_instance.stubs(:valid?).returns(false)
    put :update, :id => PlanHour.first
    assert_template 'edit'
  end

  def test_update_valid
    PlanHour.any_instance.stubs(:valid?).returns(true)
    put :update, :id => PlanHour.first
    assert_redirected_to plan_hour_url(assigns(:plan_hour))
  end

  def test_destroy
    plan_hour = PlanHour.first
    delete :destroy, :id => plan_hour
    assert_redirected_to plan_hours_url
    assert !PlanHour.exists?(plan_hour.id)
  end
end
