require 'bundler'
Bundler::GemHelper.install_tasks

require 'cucumber/rake/task'

Cucumber::Rake::Task.new(:features) do |config|
  config.cucumber_opts = 'features --format pretty --backtrace'
end

task default: :features
