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

  test 'can upload a file with Shrine' do
    gif = Gif.create(image: File.open('test/files/giphy.gif','rb'))
    assert_equal "gif", gif.image.extension
    assert_equal "image/gif", gif.image.mime_type
  end

end