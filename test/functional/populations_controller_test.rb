require 'test_helper'

class PopulationsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Population.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Population.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Population.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to population_url(assigns(:population))
  end
  
  def test_edit
    get :edit, :id => Population.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Population.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Population.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Population.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Population.first
    assert_redirected_to population_url(assigns(:population))
  end
  
  def test_destroy
    population = Population.first
    delete :destroy, :id => population
    assert_redirected_to populations_url
    assert !Population.exists?(population.id)
  end
end
