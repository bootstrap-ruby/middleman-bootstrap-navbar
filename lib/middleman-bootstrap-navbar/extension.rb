require 'middleman-core'
require 'middleman-core/version'

module Middleman
  module BootstrapNavbar
    if Middleman::VERSION.split('.').first.to_i == 3
      class Extension < Middleman::Extension
        def registered(app)
          ::BootstrapNavbar.configure(&block) if block_given?
          app.helpers ::BootstrapNavbar::Helpers
        end
        alias :included :registered
      end
    else
      class Extension < Extension
        def initialize(app, options_hash = {}, &block)
          super
          ::BootstrapNavbar.configure(&block) if block_given?
        end

        helpers ::BootstrapNavbar::Helpers
      end
    end
  end
end

Middleman::Extensions.register :bootstrap_navbar, Middleman::BootstrapNavbar::Extension
