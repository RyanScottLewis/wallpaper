# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "wallpaper"
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Ryan Scott Lewis"]
  s.date = "2012-10-09"
  s.description = "Easily obtain wallpapers from common desktop wallpaper websites."
  s.email = "ryan@rynet.us"
  s.files = ["VERSION", "wallpapers.gemspec"]
  s.homepage = "http://github.com/c00lryguy/wallpaper"
  s.post_install_message = "This is a placeholder gem... for now. Check back in a few versions!"
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.24"
  s.summary = "An interface to common desktop wallpaper websites."

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<version>, ["~> 1"])
    else
      s.add_dependency(%q<version>, ["~> 1"])
    end
  else
    s.add_dependency(%q<version>, ["~> 1"])
  end
end
