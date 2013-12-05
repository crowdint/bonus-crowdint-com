module RequestMacros
  def login
    before(:each) do
      @user ||= User.create email: 'email@test.com', password: 'pass'
      post user_session_path,
        user: { email: @user.email, password: @user.password }
    end
  end
end
