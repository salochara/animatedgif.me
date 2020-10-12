require 'test_helper'

class GifTest < ActiveSupport::TestCase
  setup do
    @user = users(:one)
  end


   test 'can assign a list of tags' do
    gif = Gif.new(tag_list: "one, two, three")
    assert_equal ["one", "two", "three"], gif.tag_list
  end

  test 'can assign an image' do
    gif = Gif.create(image: File.open('test/files/giphy.gif', 'rb'))
    assert_equal "gif", gif.image.extension
    assert_equal "image/gif", gif.image.mime_type
  end

  test 'requires at least one tag' do
    gif = Gif.new user: @user, image_data: TestData.image_data
    assert_not gif.valid?
    assert_equal ["must have at least one tag"], gif.errors[:tag_list]
  end

  test 'gif upload requires an image' do
    gif = Gif.new user: @user, tag_list: ["hey","test"]
    assert_not gif.valid?
    assert_equal ["can't be blank"], gif.errors[:image_data]

  end

end
