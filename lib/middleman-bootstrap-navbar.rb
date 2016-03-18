require_relative 'middleman-bootstrap-navbar/version'

require 'bootstrap-navbar'

::BootstrapNavbar.configure do |config|
  config.current_url_method = 'current_page.url'
end

require_relative 'middleman-bootstrap-navbar/extension'
