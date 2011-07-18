require 'test_helper'

class FixedCostsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => FixedCost.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    FixedCost.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    FixedCost.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to fixed_cost_url(assigns(:fixed_cost))
  end

  def test_edit
    get :edit, :id => FixedCost.first
    assert_template 'edit'
  end

  def test_update_invalid
    FixedCost.any_instance.stubs(:valid?).returns(false)
    put :update, :id => FixedCost.first
    assert_template 'edit'
  end

  def test_update_valid
    FixedCost.any_instance.stubs(:valid?).returns(true)
    put :update, :id => FixedCost.first
    assert_redirected_to fixed_cost_url(assigns(:fixed_cost))
  end

  def test_destroy
    fixed_cost = FixedCost.first
    delete :destroy, :id => fixed_cost
    assert_redirected_to fixed_costs_url
    assert !FixedCost.exists?(fixed_cost.id)
  end
end
