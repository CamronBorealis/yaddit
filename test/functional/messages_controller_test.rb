require 'test_helper'

class MessagesControllerTest < ActionController::TestCase
  test "should get list" do
  	login
    get :list
    assert_response :success
  	assert_no_flashes
  end

  test "should show message" do
  	login
  	get :show, :id=>1
  	assert_response :success
  	assert_no_flashes
  end

  test "should show new message form" do
  	login
  	get :new
  	assert_response :success
  	assert_no_flashes
  end

  test "should create new message successfully" do
  	login
  	post :create, {:message=>{:body=>"Body", :title=>"Title"}}
  	assert_redirected_to :controller=>"messages", :action=>"show", :id=>3
  	assert_no_flashes
  end

end
