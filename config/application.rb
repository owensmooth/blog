require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you"ve limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Blog
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    config.action_mailer.delivery_method = :smtp
    config.action_mailer.smtp_settings = {
      :address                => "smtp.postmarkapp.com",
      :port                   => 25,
      :user_name               => ENV.fetch("POSTMARK_USERNAME"),
      :password                => ENV.fetch("POSTMARK_PASSWORD"),
      :authentication         => "plain",
    :enable_starttls_auto     => true
    }

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    config.action_mailer.default_url_options = { host: "localhost:3000" }
    config.action_mailer.asset_host = "http://localhost:3000"
  end
end
