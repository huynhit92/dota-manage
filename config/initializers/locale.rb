# in config/initializers/locale.rb
 
# tell the I18n library where to find your translations
I18n.config.enforce_available_locales = false
I18n.load_path += Dir[Rails.root.join('lib', 'locale', '*.{rb,yml}')]
# set default locale to something other than :en
I18n.default_locale = :vn