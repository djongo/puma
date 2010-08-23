require 'test_helper'

class CountryTeamsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => CountryTeam.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    CountryTeam.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    CountryTeam.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to country_team_url(assigns(:country_team))
  end
  
  def test_edit
    get :edit, :id => CountryTeam.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    CountryTeam.any_instance.stubs(:valid?).returns(false)
    put :update, :id => CountryTeam.first
    assert_template 'edit'
  end
  
  def test_update_valid
    CountryTeam.any_instance.stubs(:valid?).returns(true)
    put :update, :id => CountryTeam.first
    assert_redirected_to country_team_url(assigns(:country_team))
  end
  
  def test_destroy
    country_team = CountryTeam.first
    delete :destroy, :id => country_team
    assert_redirected_to country_teams_url
    assert !CountryTeam.exists?(country_team.id)
  end
end
