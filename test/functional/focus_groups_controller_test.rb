require 'test_helper'

class FocusGroupsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => FocusGroup.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    FocusGroup.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    FocusGroup.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to focus_group_url(assigns(:focus_group))
  end
  
  def test_edit
    get :edit, :id => FocusGroup.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    FocusGroup.any_instance.stubs(:valid?).returns(false)
    put :update, :id => FocusGroup.first
    assert_template 'edit'
  end
  
  def test_update_valid
    FocusGroup.any_instance.stubs(:valid?).returns(true)
    put :update, :id => FocusGroup.first
    assert_redirected_to focus_group_url(assigns(:focus_group))
  end
  
  def test_destroy
    focus_group = FocusGroup.first
    delete :destroy, :id => focus_group
    assert_redirected_to focus_groups_url
    assert !FocusGroup.exists?(focus_group.id)
  end
end
