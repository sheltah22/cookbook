require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Cookbook
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    if File.read('/proc/1/cgroup').include?('docker')
      # https://stackoverflow.com/a/24716645/4862360
      host_ip = `/sbin/ip route|awk '/default/ { print $3 }'`.strip

      BetterErrors::Middleware.allow_ip!(host_ip) if defined?(BetterErrors::Middleware)
      config.web_console.whitelisted_ips << host_ip
    end
  end
end
