require 'test_helper'

class PublicationsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Publication.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Publication.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Publication.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to publication_url(assigns(:publication))
  end
  
  def test_edit
    get :edit, :id => Publication.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Publication.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Publication.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Publication.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Publication.first
    assert_redirected_to publication_url(assigns(:publication))
  end
  
  def test_destroy
    publication = Publication.first
    delete :destroy, :id => publication
    assert_redirected_to publications_url
    assert !Publication.exists?(publication.id)
  end
end
