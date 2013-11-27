require_relative 'middleman-bootstrap-navbar/version'

require 'bootstrap-navbar'
BootstrapNavbar.configure do |config|
  config.current_url_method = 'current_page.url'
end

module Middleman
  module BootstrapNavbar
    class << self
      def registered(app)
        app.helpers ::BootstrapNavbar::Helpers
      end
      alias :included :registered
    end
  end
end

require 'middleman-core/extensions' unless defined?(Middleman::Extensions)
Middleman::Extensions.register :bootstrap_navbar, Middleman::BootstrapNavbar
