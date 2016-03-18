lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'middleman-bootstrap-navbar/version'

Gem::Specification.new do |gem|
  gem.name          = 'middleman-bootstrap-navbar'
  gem.version       = Middleman::BootstrapNavbar::VERSION
  gem.platform      = Gem::Platform::RUBY
  gem.author        = 'Manuel Meurer'
  gem.email         = 'manuel@krautcomputing.com'
  gem.summary       = 'Middleman extension to easily generate a Bootstrap style navbar'
  gem.description   = 'Middleman extension to easily generate a Bootstrap style navbar'
  gem.homepage      = 'http://bootstrap-ruby.github.io/middleman-bootstrap-navbar'
  gem.license       = 'MIT'

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r(^bin/)).map { |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r(^(test|spec|features)/))
  gem.require_paths = ['lib']

  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'appraisal'
  gem.add_development_dependency 'cucumber',     '~> 2.3'
  gem.add_development_dependency 'aruba',        '~> 0.14'

  gem.add_runtime_dependency 'bootstrap-navbar', '~> 2.0'
  gem.add_runtime_dependency 'middleman',        '>= 3.1'
end
