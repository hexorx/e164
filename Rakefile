require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "e164"
    gem.summary = %Q{This gem provides e164 parsing and normalization}
    gem.description = %Q{The e164 gem can parse and normalize numbers into the e164 format.
      It provides extra information on the Country Code and National Destination Codes.
      It can be used standalone or mixed into a model.}
    gem.email = "hexorx@gmail.com"
    gem.homepage = "http://github.com/hexorx/e164"
    gem.authors = ["hexorx"]
    gem.add_development_dependency "rspec"
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: sudo gem install jeweler"
end

require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec)

task :default => :spec