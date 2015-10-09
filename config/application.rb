require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Dota
  class Application < Rails::Application
    config.active_record.raise_in_transactional_callbacks = true

    config.time_zone = 'Tokyo'
    config.active_record.default_timezone = :local

    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}')]
    config.i18n.default_locale = :ja
    
    config.active_record.raise_in_transactional_callbacks = true
    config.colorize_logging = true
  end
end
