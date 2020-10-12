require 'test_helper'

class GifTest < ActiveSupport::TestCase
  test 'can assign a list of tags' do
    gif = Gif.new(tag_list: "one, two, three")
    assert_equal ["one", "two", "three"], gif.tag_list
  end

  test 'can assign an image' do
    Gif.create(image: File.open(test/files))
  end

  test 'requires at least one tag' do
    gif = Gif.new user: users(:one), image_data: TestData.image_data
    assert_not gif.valid?
    assert_equal ["must have at least one tag"], gif.errors[:tag_list]
  end

end
