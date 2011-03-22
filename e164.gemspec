# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{e164}
  s.version = "0.1.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["hexorx"]
  s.date = %q{2011-03-21}
  s.description = %q{The e164 gem can parse and normalize numbers into the e164 format.
      It provides extra information on the Country Code and National Destination Codes.
      It can be used standalone or mixed into a model.}
  s.email = %q{hexorx@gmail.com}
  s.extra_rdoc_files = [
    "LICENSE",
    "README.markdown"
  ]
  s.files = [
    ".document",
    "LICENSE",
    "README.markdown",
    "Rakefile",
    "VERSION",
    "e164.gemspec",
    "lib/e164.rb",
    "lib/e164/country_codes.rb",
    "lib/e164/national_destination_codes/austria.rb",
    "lib/e164/national_destination_codes/germany.rb",
    "lib/e164/national_destination_codes/nanp.rb",
    "lib/load_data.sql",
    "spec/e164_spec.rb",
    "spec/spec_helper.rb"
  ]
  s.homepage = %q{http://github.com/hexorx/e164}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{This gem provides e164 parsing and normalization}
  s.test_files = [
    "spec/e164_spec.rb",
    "spec/spec_helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rspec>, [">= 0"])
      s.add_development_dependency(%q<yard>, [">= 0"])
    else
      s.add_dependency(%q<rspec>, [">= 0"])
      s.add_dependency(%q<yard>, [">= 0"])
    end
  else
    s.add_dependency(%q<rspec>, [">= 0"])
    s.add_dependency(%q<yard>, [">= 0"])
  end
end

