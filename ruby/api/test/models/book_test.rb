require 'test_helper'

class BookTest < ActiveSupport::TestCase
  test "owner" do
    book = books(:one)
    assert_equal book.creator, users(:guest)
  end

  test "author" do
    book = books(:one)
    assert_equal book.author, authors(:one)
  end
end
