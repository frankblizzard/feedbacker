require 'test_helper'

class WorkCategoriesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => WorkCategory.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    WorkCategory.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    WorkCategory.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to work_category_url(assigns(:work_category))
  end

  def test_edit
    get :edit, :id => WorkCategory.first
    assert_template 'edit'
  end

  def test_update_invalid
    WorkCategory.any_instance.stubs(:valid?).returns(false)
    put :update, :id => WorkCategory.first
    assert_template 'edit'
  end

  def test_update_valid
    WorkCategory.any_instance.stubs(:valid?).returns(true)
    put :update, :id => WorkCategory.first
    assert_redirected_to work_category_url(assigns(:work_category))
  end

  def test_destroy
    work_category = WorkCategory.first
    delete :destroy, :id => work_category
    assert_redirected_to work_categories_url
    assert !WorkCategory.exists?(work_category.id)
  end
end
