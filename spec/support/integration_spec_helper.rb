module IntegrationSpecHelper
  def login_with_google_oauth(service = :google)
    visit '/auth/google_oauth2'
  end
end
