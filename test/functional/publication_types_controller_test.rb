require 'test_helper'

class PublicationTypesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => PublicationType.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    PublicationType.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    PublicationType.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to publication_type_url(assigns(:publication_type))
  end
  
  def test_edit
    get :edit, :id => PublicationType.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    PublicationType.any_instance.stubs(:valid?).returns(false)
    put :update, :id => PublicationType.first
    assert_template 'edit'
  end
  
  def test_update_valid
    PublicationType.any_instance.stubs(:valid?).returns(true)
    put :update, :id => PublicationType.first
    assert_redirected_to publication_type_url(assigns(:publication_type))
  end
  
  def test_destroy
    publication_type = PublicationType.first
    delete :destroy, :id => publication_type
    assert_redirected_to publication_types_url
    assert !PublicationType.exists?(publication_type.id)
  end
end
