# test/controllers/messages_controller_test.rb
require "test_helper"

class MessagesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get messages_url   # or messages_path
    assert_response :success
  end

  test "should create" do
    post messages_url, params: { message: { content: "hello", role: "user" } }
    assert_response :redirect
    assert_redirected_to root_url

    follow_redirect!
    assert_response :success
  end
end
