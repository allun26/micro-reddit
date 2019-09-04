require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user = User.new(name: "example", email: "example@example.com")
  end

  test "The user is valid" do
    assert @user.valid?
  end

  test "User name is present, and has a max length" do
    @user.name = 'a' * 51
    assert_not @user.valid?
  end

  test "validation should reject invalid email address" do
    invalid_emails = %w[user@example,com user_at_foo.org user.name@example.
      foo@bar_baz.com foo@bar+baz..com]
      invalid_emails.each do |i|
        @user.email = i
        assert_not @user.valid?
      end
  end

  test "validation should accept valid email address" do
    invalid_emails = %w[user@example.com foo@example.ex.com]
      invalid_emails.each do |i|
        @user.email = i
        assert @user.valid?
      end
  end

  test "email cant be empty" do
    @user.email = ''
    assert_not @user.valid?
  end
end
