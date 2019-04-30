require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  
  def setup
    ActionMailer::Base.deliveries.clear
  end
  
  test "invalid signup information" do
    get signup_path
    
    assert_select 'form[action="/signup"]'
    
    assert_no_difference 'User.count' do
    post signup_path, params: { user: { name: "", 
                                        email: "user@invalid", 
                                        password: "foo", 
                                        password_confirmation: "bar" } }
    end
    assert_template 'users/new'
    assert_select 'div#error_explanation'
    assert_select 'div.field_with_errors'
  end
  
  test "valid signup information with account activation" do
    get signup_path
    
    assert_difference 'User.count', 1 do
    post signup_path, params: { user: { name: "John Doe", 
                                        email: "johndoe@example.com", 
                                        password: "validpassword", 
                                        password_confirmation: "validpassword" } }  
    end
    assert_equal 1, ActionMailer::Base.deliveries.size
    user = assigns(:user)
    assert_not user.activated?
    # Try to log in before activation
    log_in_as user
    assert_not is_logged_in?
    # Index page
    # Log in as valid user
    log_in_as(users(:michael))
    # Unactivated user is on 2nd page
    get users_path(page: 2)
    assert_no_match user.name, response.body
    # Profile page
    get user_path(user)
    assert_redirected_to root_path
    # Log out valid user
    delete logout_path
    # Invalid activation token
    get edit_account_activation_path("invalid token", email: user.email)
    assert_not is_logged_in?
    # Valid token, wrong email
    get edit_account_activation_path(user.activation_token, email: "wrong")
    assert_not is_logged_in?
    # Valid activation token
    get edit_account_activation_path(user.activation_token, email: user.email)
    assert user.reload.activated?
    follow_redirect!
    assert_template 'users/show'
    assert is_logged_in?
  end
end