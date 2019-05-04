require 'test_helper'

class MicropostTest < ActiveSupport::TestCase
  
  def setup
    @user = users(:michael)
    @micropost = @user.microposts.build(content: "Lorem ipsum")
    @example = User.new(name: "Example User", email: "user@example.com",
                     password: "foobar", password_confirmation: "foobar")
  end
  
  test "should be valid" do
    assert @micropost.valid?
  end
  
  test "user id should be present" do
    @micropost.user_id = nil
    assert_not @micropost.valid?
  end
  
  test "content should be present" do
    @micropost.content = "    "
    assert_not @micropost.valid?
  end
  
  test "content should be at most 140 characters" do
    @micropost.content = "a" * 141
    assert_not @micropost.valid?
  end
  
  test "should be most recent first" do
    assert_equal microposts(:most_recent), Micropost.first
  end
  
  test "associated microposts should be destroyed" do
    @example.save
    @example.microposts.create!(content: "Lorem ipsum")
    assert_difference "Micropost.count", -1 do
      @example.destroy
    end
  end
end
