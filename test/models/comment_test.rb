require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: 'example', email: 'aaa@example.com')
    @user.save
    @post = @user.posts.build(title: 'new post', body: 'example example exampleexample example example example example')
    @comment = @post.comments.build(content: 'sdfsdfnaosdjfnasdfjn', user_id: @user.id)
  end

  test "The comment is valid" do
    assert @comment.valid?
  end

  test "The comment cant be empty" do
    @comment.content = ""
    assert_not @comment.valid?
  end
end
