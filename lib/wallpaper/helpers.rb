require 'active_support/core_ext/hash/indifferent_access'

class Wallpaper
  module Helpers
    # Raises an error if `opts` does not respond to `to_hsh` or `to_h`
    def validate_options(opts)
      raise 'opts must respond to `to_hsh` or `to_h`' unless opts.respond_to?(:to_hsh) || opts.respond_to?(:to_h)
    end
    
    # Simply make sure that `opts` can be converted into a Hash, then does so.
    # Then returns `opts` as a HashWithIndifferentAccess.
    def sanitize_options(opts)
      opts = opts.to_hsh rescue opts.to_h
      
      HashWithIndifferentAccess.new(opts)
    end
    
    # Raises an error if `opts` does not contain the `key`
    def validate_option_key(opts, key)
      raise "opts[:#{key}] or opts['#{key}'] must be given" unless opts.has_key?(key)
    end
    
    # See `Wallpaper::Helpers#validate_option_key`
    def validate_option_keys(opts, *keys)
      keys.each { |key| validate_option_key(opts, key) }
    end
  end
end