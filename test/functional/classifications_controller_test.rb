require 'test_helper'

class ClassificationsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Classification.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Classification.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Classification.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to classification_url(assigns(:classification))
  end
  
  def test_edit
    get :edit, :id => Classification.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Classification.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Classification.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Classification.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Classification.first
    assert_redirected_to classification_url(assigns(:classification))
  end
  
  def test_destroy
    classification = Classification.first
    delete :destroy, :id => classification
    assert_redirected_to classifications_url
    assert !Classification.exists?(classification.id)
  end
end
