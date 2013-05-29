require 'test_helper'

class SessionControllerTest < ActionController::TestCase
  test "should get create" do
    get :create, :credentials=>{:email=>"first@user.com", :password=>"password"}
    assert_redirected_to :controller=>"messages", :action=>"list"
    assert_no_flashes
  end

  test "should get destroy" do
    get :destroy
    assert_redirected_to :controller=>"session", :action=>"log_in"
  end

end
