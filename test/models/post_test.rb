require 'test_helper'

class PostTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: "Jacob", email: "jacob@yahoo.com")
    @user.save!
    @post = Post.new(title: "A new post that has a 50 character title for sure, or am I?", body: "Some text", user_id: @user.id)
  end

  

end
