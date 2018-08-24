module AuthHelper
  def http_login
    # user = "admin"
    # pw = "password"
    # request.env["HTTP_AUTHORIZATION"] = ActionController::HttpAuthentication::Basic.encode_credentials(user,pw)
  end

  def http_auth
    name = "admin"
    password = "password"

    if page.driver.respond_to?(:basic_auth)
      page.driver.basic_auth(name, password)
    elsif page.driver.respond_to?(:basic_authorize)
      page.driver.basic_authorize(name, password)
    elsif page.driver.respond_to?(:browser) && page.driver.browser.respond_to?(:basic_authorize)
      page.driver.browser.basic_authorize(name, password)
    else
      visit "http://#{name}:#{password}@#{Capybara.current_session.server.host}:#{Capybara.current_session.server.port}/admin"
    end
  end
end
