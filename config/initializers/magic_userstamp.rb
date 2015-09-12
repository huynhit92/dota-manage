require 'magic_userstamp'
# Comment out if you don't use t.userstamp at all in migrations
ActiveRecord::ConnectionAdapters::TableDefinition.send(:include, MagicUserstamp::MigrationHelper)
ActiveRecord::Base.module_eval do
  include MagicUserstamp
end

MagicUserstamp.config.setup do |config|
  config.with_options(:stamper_class_name => 'User') do |c|
    c.on(:create , :created_by)
    c.on(:update , :updated_by)
  end
end
# If you have some classes which has loaded before Userstamp is loaded,
# set record_userstamp true
# Example: vestal_versions gem
# Version.record_userstamp = true if defined?(Version)