require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: 'example', email: 'aaa@example.com')
    @user.save
    @post = Post.new(title: 'new post', body: 'example example exampleexample example example example example', user_id: @user.id)
    @post.save
    @comment = Comment.new(content: 'sdfsdfnaosdjfnasdfjn', user_id: @user.id, post_id: @post.id)
  end

  test "The comment is valid" do
    assert @comment.valid?
  end

  test "The comment cant be empty" do
    @comment.content = ""
    assert_not @comment.valid?
  end
end
