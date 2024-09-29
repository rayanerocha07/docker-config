require "test_helper"

class Identity::PasswordResetsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:lazaro_nixon)
  end

  test "should get new" do
    get new_identity_password_reset_url
    assert_response :success
  end

  test "should get edit" do
    sid = @user.password_reset_tokens.create.signed_id(expires_in: 20.minutes)

    get edit_identity_password_reset_url(sid: sid)
    assert_response :success
  end

  test "should send a password reset email" do
    perform_enqueued_jobs do
      post identity_password_reset_url, params: { email: @user.email }
    end

    assert_enqueued_email_with UserMailer, :password_reset, args: [{ user: @user }]
    assert_redirected_to sign_in_url
  end

  test "should not send a password reset email to a nonexistent email" do
    assert_no_enqueued_emails do
      post identity_password_reset_url, params: { email: "invalid_email@hey.com" }
    end

    assert_redirected_to new_identity_password_reset_url
    assert_equal "You can't reset your password until you verify your email", flash[:alert]
  end

  test "should not send a password reset email to a unverified email" do
    @user.update! verified: false

    assert_no_enqueued_emails do
      post identity_password_reset_url, params: { email: @user.email }
    end

    assert_redirected_to new_identity_password_reset_url
    assert_equal "You can't reset your password until you verify your email", flash[:alert]
  end

  test "should update password" do
    sid = @user.password_reset_tokens.create.signed_id(expires_in: 20.minutes)

    patch identity_password_reset_url, params: { sid: sid, password: "Secret6*4*2*", password_confirmation: "Secret6*4*2*" }
    assert_redirected_to sign_in_url
  end

  test "should not update password with expired token" do
    sid_exp = @user.password_reset_tokens.create.signed_id(expires_in: 0.minutes)

    patch identity_password_reset_url, params: { sid: sid_exp, password: "Secret6*4*2*", password_confirmation: "Secret6*4*2*" }
    assert_redirected_to new_identity_password_reset_url
    assert_equal "That password reset link is invalid", flash[:alert]
  end
end