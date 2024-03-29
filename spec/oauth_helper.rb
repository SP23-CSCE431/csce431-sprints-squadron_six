# def mock_google_oauth2
#   # Authuser.config.test_mode = true
#   Authuser.config.mock_auth[:google_oauth2] = Authuser::AuthHash.new({
#                                                                        provider: 'google_oauth2',
#                                                                        uid: '108924254985749898215',
#                                                                        info: {
#                                                                          email: 'ivanattexas@tamu.edu',
#                                                                          name: 'Ivan Martinez',
#                                                                          first_name: 'Ivan',
#                                                                          last_name: 'Martinez',
#                                                                          image: 'https://lh3.googleusercontent.com/a/AGNmyxZ9w0R3_loFhlk46VAFMyqvC2ZqrZgHuPYnlaAH=s96-c'
#                                                                        },
#                                                                        credentials: {
#                                                                          token: auth.credentials.token,
#                                                                          refresh_token: auth.credentials.refresh_token,
#                                                                          expires_at: Time.now + 1.week
#                                                                        }
#                                                                      })
# end
# def mock_auth_hash(provider, email)
#   OmniAuth.config.mock_auth[provider] = OmniAuth::AuthHash.new({
#                                                                  provider: provider.to_s,
#                                                                  uid: '108924254985749898215',
#                                                                  info: {
#                                                                    email:
#                                                                  },
#                                                                  credentials: {
#                                                                    token: 'token',
#                                                                    refresh_token: 'refresh_token',
#                                                                    expires_at: Time.now + 1.week
#                                                                  }
#                                                                })
# end
require 'omniauth'
require 'omniauth-google-oauth2'
def mock_google_oauth2
  OmniAuth.config.test_mode = true

  OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new({
                                                                       provider: 'google_oauth2',
                                                                       uid: '108924254985749898215',
                                                                       info: {
                                                                         email: 'ivanattexas@tamu.edu',
                                                                         name: 'Ivan Martinez',
                                                                         first_name: 'Ivan',
                                                                         last_name: 'Martinez',
                                                                         image: 'https://lh3.googleusercontent.com/a/AGNmyxZ9w0R3_loFhlk46VAFMyqvC2ZqrZgHuPYnlaAH=s96-c'
                                                                       },
                                                                       credentials: {
                                                                         token: auth.credentials.token,
                                                                         refresh_token: auth.credentials.refresh_token,
                                                                         expires_at: Time.now + 1.week
                                                                       }
                                                                     })
end
