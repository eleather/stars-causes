require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
  config.time_zone = 'UTC'

  config.action_mailer.default_url_options ||= {:host => 'localhost:3000'}
  config.action_controller.session = {
    :key => "_stars_session", :secret => "my cat is yellow"
  }
  config.action_controller.asset_host = "http://#{ENV['APP_HOST']}"
end

ActionView::Helpers::AssetTagHelper.
    register_javascript_expansion :jquery => [
  'https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js',
  'http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.1/jquery-ui.min.js'
]
