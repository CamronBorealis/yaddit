require 'test_helper'

class SessionControllerTest < ActionController::TestCase
  test "should get create" do
    post :create, :credentials=>{:email=>"first@user.com", :password=>"password"}
    assert_no_flashes
    assert_redirected_to messages_list_path
  end

  test "should get destroy" do
    get :destroy
    assert_redirected_to :controller=>"session", :action=>"log_in"
  end

  test "should return message on incorrect login" do
  	post :create, :credentials=>{:email=>"first@user.com", :password=>"wrong_password"}
  	assert_equal "That username/password combination is invalid", flash[:error]
  end

end
