require 'rake/version_task'
require 'rspec/core/rake_task'
require 'rubygems/package_task'
require 'pathname'

spec = Gem::Specification.new do |s|
  s.name         = 'wallpaper'
  s.platform     = Gem::Platform::RUBY
  s.version      = Pathname.new(__FILE__).dirname.join('VERSION').read.strip
  s.author       = 'Ryan Scott Lewis'
  s.email        = 'ryan@rynet.us'
  s.homepage     = "http://github.com/c00lryguy/#{s.name}"
  s.summary      = 'An interface to common desktop wallpaper websites.'
  s.description  = 'Easily obtain wallpapers from common desktop wallpaper websites.'
  s.require_path = 'lib'
  s.post_install_message = "This is a placeholder gem... for now. Check back in a few versions!"
  s.files        = `git ls-files`.lines.to_a.collect { |s| s.strip }
  s.executables  = `git ls-files -- bin/*`.lines.to_a.collect { |s| File.basename(s.strip) }
  
  s.add_dependency 'version', '~> 1'
end

Rake::VersionTask.new do |t|
  t.with_git_tag = true
  t.with_gemspec = spec
end

RSpec::Core::RakeTask.new

Gem::PackageTask.new(spec) do |t|
  t.need_zip = true
  t.need_tar = true
end

task :default => :spec