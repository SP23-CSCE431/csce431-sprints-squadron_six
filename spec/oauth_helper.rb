def mock_google_oauth2
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new({
      provider: 'google_oauth2',
      uid: '123456789',
      info: {
        email: 'user@example.com',
        name: 'John Doe',
        first_name: 'John',
        last_name: 'Doe',
        image: 'https://lh3.googleusercontent.com/a-/1234567890'
      },
      credentials: {
        token: 'token',
        refresh_token: 'refresh_token',
        expires_at: Time.now + 1.week
      }
    })
end