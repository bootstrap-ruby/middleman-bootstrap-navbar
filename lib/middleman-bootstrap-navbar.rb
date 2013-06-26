require 'middleman-bootstrap-navbar/version'
require 'middleman-bootstrap-navbar/helpers'

module Middleman
  module BootstrapNavbar
    class << self
      def registered(app)
        app.helpers Helpers
      end
      alias :included :registered
    end
  end
end

::Middleman::Extensions.register :bootstrap_navbar, Middleman::BootstrapNavbar
