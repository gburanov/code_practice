require 'test_helper'

class AuthorTest < ActiveSupport::TestCase
  test "books" do
    author = authors(:one)
    assert_equal author.books.size, 2
  end

  test "owner" do
    author = authors(:one)
    assert_equal author.creator, users(:user)
  end
end
