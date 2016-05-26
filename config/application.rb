require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module WatchedBackend
  class Application < Rails::Application
    config.api_only = true
    config.active_record.raise_in_transactional_callbacks = true


    config.middleware.insert_before 0, "Rack::Cors" do
      allow do
        origins '*'

      resource '/cors',
        :headers => :any,
        :methods => [:post],
        :credentials => true,
        :max_age => 0

      resource '*',
        :headers => :any,
        :methods => [:get, :post, :delete, :put, :patch, :head],
        :max_age => 0,
        :expose => ['access-token','token-type','expiry','client','uid', 'Content-Type']
      end
    end
  end
end
