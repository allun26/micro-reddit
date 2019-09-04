require 'test_helper'

class PostTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: "Jacob", email: "jacob@yahoo.com")
    @user.save!
    @post = Post.new(title: "A mundane title", body: "A new post that has a 50 character body for sure, or am I?", user_id: @user.id)
  end

  test "post should be valid" do
    assert @post.valid?
  end 

  test "post should have a title" do
    post_duplicate = @post.dup
    post_duplicate.title = ''
    assert_not post_duplicate.valid?
  end

  test "post body should have at least 50 characters" do 
    post_duplicate = @post.dup
    post_duplicate.body = "This is definitely not up to 50 characters"
  end

  test "post should have a body" do
    post_duplicate = @post.dup
    post_duplicate.body = nil
    assert_not post_duplicate.valid?
  end

end
