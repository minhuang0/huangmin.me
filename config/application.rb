# -*- encoding : utf-8 -*-
require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Blog
  class Application < Rails::Application
    #北京时区
    config.time_zone='Beijing'
    config.active_record.default_timezone= :local
    config.assets.enabled = true
    config.assets.paths << Rails.root.join('/app/assets/fonts')
  end
end
