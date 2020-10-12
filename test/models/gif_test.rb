require 'test_helper'

class GifTest < ActiveSupport::TestCase
  test 'can assign a list of tags' do
    gif = Gif.new(tag_list: "one, two, three")
    assert_equal ["one", "two", "three"], gif.tag_list
  end

end
