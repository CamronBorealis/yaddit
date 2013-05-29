require 'test_helper'

class MessagesControllerTest < ActionController::TestCase
  test "should get list" do
  	session[:user_id] = 1
    get :list
    assert_response :success
  end

end
