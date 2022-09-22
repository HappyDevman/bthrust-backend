# frozen_string_literal: true

require_relative('boot')

require 'rails'
# Pick the frameworks you want:
require 'active_model/railtie'
require 'active_job/railtie'
require 'active_record/railtie'
require 'active_storage/engine'
require 'action_controller/railtie'
require 'action_mailer/railtie'
require 'action_view/railtie'
require 'action_cable/engine'
require 'action_text/engine'
require 'sprockets/railtie'
require_relative '../lib/console_methods'
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Lingu
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0
    config.active_record.schema_format = :sql

    config.exceptions_app = self.routes
    config.railties_order = [
      ActiveStorage::Engine,
      ActionCable::Engine,
      :main_app,
      :all
    ]

    config.generators do |generate|
      generate.helper false
      generate.assets false
      generate.view_specs false
    end

    config.hosts << "admin.localhost.com"
    config.hosts << "teach.localhost.com"
    config.hosts << "school.localhost.com"
    config.hosts << "www.example.com"
    config.hosts << "localhost.com"
    config.hosts << "school.lvh.me"

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    # Don't generate system test files.
    config.generators.system_tests = nil
    config.i18n.available_locales = %i[en nb es fr pt de pl lt lv uk bg ru tr ro sr nl it so sw]

    config.i18n.default_locale = :en

    # config.paths.add File.join('app', 'api'), glob: File.join('**', '*.rb')
    config.autoload_paths += Dir[Rails.root.join('app', 'api', '*')]

    config.to_prepare do
      Devise::SessionsController.layout 'auth/index'
      Devise::RegistrationsController.layout proc { |_controller| signed_in?(:user) ? 'admin/admin' : 'auth/index' }
      Devise::ConfirmationsController.layout 'auth/index'
      Devise::UnlocksController.layout 'auth/index'
      Devise::PasswordsController.layout 'auth/index'
    end
    config.action_view.default_form_builder = 'CustomFormBuilder::Base'
    config.middleware.use(OliveBranch::Middleware,
                          inflection: 'snake',
                          inflection_header: 'X-Inflect-With')
  end
end
