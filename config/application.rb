require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
# config/application.rb
Bundler.require(*Rails.groups)

module AlphaBlog
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2
    config.assets.initialize_on_precompile = false
    
    config.action_mailer.smtp_settings = {
      :enable_starttls_auto => true,
      :address => 'smtp.gmail.com',
      :port => 587,
      :authentication => :plain,
      :domain         => 'gmail',
      :user_name        => ENV['GMAIL_USERNAME'],
      :password         => ENV['GMAIL_PASSWORD']
    }
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
