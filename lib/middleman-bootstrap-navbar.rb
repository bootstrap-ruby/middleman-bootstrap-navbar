require 'middleman-bootstrap-navbar/version'

require 'bootstrap_navbar'
BootstrapNavbar.current_url_method = 'current_page.url'

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
