require 'test_helper'

class RepliesControllerTest < ActionController::TestCase
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Reply.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Reply.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to root_url
  end
  
  def test_edit
    get :edit, :id => Reply.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Reply.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Reply.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Reply.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Reply.first
    assert_redirected_to root_url
  end
  
  def test_destroy
    reply = Reply.first
    delete :destroy, :id => reply
    assert_redirected_to root_url
    assert !Reply.exists?(reply.id)
  end
end
