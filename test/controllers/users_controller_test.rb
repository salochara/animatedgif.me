require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  test "should get user show" do
    get user_url(@user)
    assert_response :success
    assert_select "h3","#{@user.name}'s Gifs"
  end

end