require 'middleman-bootstrap-navbar'
require 'rspec-html-matchers'

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus
  config.order = 'random'
end

unless defined?(Padrino::Helpers)
  require 'vendored-middleman-deps/padrino-core-0.11.2/lib/padrino-core/support_lite'
  require 'vendored-middleman-deps/padrino-helpers-0.11.2/lib/padrino-helpers'
end

module Middleman
  module BootstrapNavbar
    module Helpers
      include Padrino::Helpers::TagHelpers
      include Padrino::Helpers::AssetTagHelpers
      include Padrino::Helpers::OutputHelpers
    end
  end
end
