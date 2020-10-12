require 'test_helper'

class GifsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @gif = gifs(:one)
    @user = users(:one)
  end

  test "should get index" do
    get gifs_url
    assert_response :success
  end
  # assert responses types https://api.rubyonrails.org/v5.1.7/classes/ActionDispatch/Assertions/ResponseAssertions.html#method-i-assert_response
  test "should not be able to get new if signed out" do
    get new_gif_url
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end

  test "should be able to get new if signed in" do
    sign_in users(:one) # from the users.yml file
    get new_gif_url
    assert_response :success
  end

  test "should not be able to create gif if signed out" do
    post gifs_url, params: { gif: { image_data: @gif.image_data, user_id: @gif.user_id } }
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end

  test "should create gif if signed in" do
    sign_in @user

    assert_difference('Gif.count') do
      file = Rack::Test::UploadedFile.new('test/files/giphy.gif','image/gif')
      post gifs_url, params: { gif: { image: file, user_id: @gif.user_id , tag_list: "test"} }
    end

    assert_redirected_to gif_url(Gif.last)
  end

  test "should show gif" do
    get gif_url(@gif)
    assert_response :success
  end

  test "should get edit" do
    sign_in @user

    get edit_gif_url(@gif)
    assert_response :success
  end

  test "should not be able to edit gif if signed out" do
    get edit_gif_url(@gif)
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end

  test "should update gif" do
    sign_in @user

    patch gif_url(@gif), params: { gif: { tag_list: "New tag" } }
    assert_redirected_to gif_url(@gif)

    @gif.reload
    assert_equal(["New tag"],@gif.tag_list)
  end

  test "should not update gif if signed out" do
    patch gif_url(@gif), params: { gif: { tag_list: "New tag" } }
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end

  test "should destroy gif" do
    sign_in @user

    assert_difference('Gif.count', -1) do
      delete gif_url(@gif)
    end

    assert_redirected_to gifs_url
  end

  test "should not destroy gif if signed out" do
    delete gif_url(@gif)
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end

  test 'renders catch all' do
    get random_gif_url(tag: "test")
    assert_response :success
  end

end
