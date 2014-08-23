require 'httparty'

class Wallpaper
  class Interface
    include HTTParty
    
    class << self
      include Helpers
      
      # Find a wallpaper by it's id
      def find(opts={})
        validate_options(opts)
        opts = sanitize_options(opts)
        validate_option_key(opts, :id)
      end
      
      # Search all wallpapers
      def search(opts={})
        validate_options(opts)
        opts = sanitize_options(opts)
        validate_option_key(opts, :query)
      end
    end
    
    attr_reader :name, :size, :dimensions
    
    protected
    
    def encode_uri(uri)
      CGI.escape( uri.gsub(/\s+/, ' ') )
    end
  end
end