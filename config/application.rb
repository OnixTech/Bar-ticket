require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module BarOrder
  class Application < Rails::Application
    config.generators do |generate|
      generate.assets false
      generate.helper false
      generate.test_framework :test_unit, fixture: false
    end
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end

# config/application.rb or config/initializers/cors.rb
Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    if Rails.env.production?
      origins 'https://fillo.herokuapp.com'
    else
      origins 'http://127.0.0.1:3001'
    end
    resource '/bsktreq',
    headers: ['Content-Type','X-CSRF-Token'],
    methods: [:post],
    credentials: true

    resource '/reqtkn',
    headers: ['Content-Type', 'X-CSRF-Token'],
    methods: [:post,:get],
    credentials: true
  end
end
