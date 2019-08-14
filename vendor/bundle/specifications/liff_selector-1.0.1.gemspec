# -*- encoding: utf-8 -*-
# stub: liff_selector 1.0.1 ruby lib

Gem::Specification.new do |s|
  s.name = "liff_selector".freeze
  s.version = "1.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["4geru".freeze]
  s.bindir = "exe".freeze
  s.date = "2018-09-29"
  s.description = "Write a longer description or delete this line.".freeze
  s.email = ["westhouse@gmail.com".freeze]
  s.executables = ["liff_select".freeze]
  s.files = ["exe/liff_select".freeze]
  s.homepage = "https://github.com/4geru/liff-selector".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.0.3".freeze
  s.summary = "Write a short summary, because RubyGems requires one.".freeze

  s.installed_by_version = "3.0.3" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<dotenv>.freeze, [">= 0"])
      s.add_runtime_dependency(%q<rest-client>.freeze, [">= 0"])
      s.add_development_dependency(%q<bundler>.freeze, ["~> 1.16"])
      s.add_development_dependency(%q<rake>.freeze, ["~> 10.0"])
      s.add_development_dependency(%q<rspec>.freeze, ["~> 3.0"])
    else
      s.add_dependency(%q<dotenv>.freeze, [">= 0"])
      s.add_dependency(%q<rest-client>.freeze, [">= 0"])
      s.add_dependency(%q<bundler>.freeze, ["~> 1.16"])
      s.add_dependency(%q<rake>.freeze, ["~> 10.0"])
      s.add_dependency(%q<rspec>.freeze, ["~> 3.0"])
    end
  else
    s.add_dependency(%q<dotenv>.freeze, [">= 0"])
    s.add_dependency(%q<rest-client>.freeze, [">= 0"])
    s.add_dependency(%q<bundler>.freeze, ["~> 1.16"])
    s.add_dependency(%q<rake>.freeze, ["~> 10.0"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3.0"])
  end
end
