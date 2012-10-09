require 'pathname'
require 'bundler/setup'
require 'version'

__PATH__ = Pathname.new(__FILE__)
$:.unshift(__PATH__.dirname.to_s) unless $:.include?(__PATH__.dirname.to_s)

module Wallpaper
  VERSION = Version.current rescue '0.0.0'
end