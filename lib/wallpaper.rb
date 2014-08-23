require 'pathname'
require 'version'

require 'wallpaper/helpers'
require 'wallpaper/interfaces'

class Wallpaper
  class << self
    include Helpers
    
    def interface
      @interface ||= Wallpaper::Interfaces::DesktopNexus
    end
    
    def find(opts={})
      validate_options(opts)
      opts = { :interface => interface }.merge( sanitize_options(opts) )
      
      validate_option_keys(opts, :id, :url, :category)
    end
  end
  
  include Helpers
  
  VERSION = Version.current rescue '0.0.0'
  
  attr_reader :interface
  
  def initialize(opts={})
    validate_options(opts)
    opts = sanitize_options(opts)
  end
end