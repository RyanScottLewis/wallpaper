require 'wallpaper/interface'
require 'uniform_resource_identifier'

# <a href="http://anime.desktopnexus.com/wallpaper/980378/" title="Sweet Dreams">
#   <img src="http://static.desktopnexus.com/thumbnails/980378-200.jpg" border="1" alt="Sweet Dreams" class="thumbnail">
# </a>

class Wallpaper
  module Interfaces
    
    class DesktopNexus < Wallpaper::Interface
      
      class Scraper
        def find(html)
          nodes = html.xpath('//*[@id="mainContentWrapper"]/div/div/div[1]/div/a')
          
          nodes.collect do |node|
            thumbnail = node.xpath('.//img')
            url = UniformResourceIdentifier.parse(node['href'])
            id = File.basename(u.path.to_s.strip.gsub(/\/$/, '')).to_i
            category = uri.subdomain.to_sym
            
            { :id => id, :url => url :category => category }
          end
        end
        
        def search(data)
          
        end
      end
      
      CATEGORIES = %W{abstract aircraft animals anime architecture boats cars entertainment motorcycles nature people space sports technology videogames}
      base_uri 'desktopnexus.com'
      
      def find(opts={})
        super
        
        validate_option_key(opts, :category)
        opts[:category].strip!.downcase!
        raise "opts[:category] must be one of the following: #{CATEGORIES.join(', ')}" unless CATEGORIES.include?(opts[:category])
        
        self.class.get("http://#{opts[:category]}.desktopnexus.com/wallpaper/#{opts[:id]}")
      end
      
      def search(opts={})
        super
        
        opts[:query] = encode_uri(opts[:query])
        
        self.class.get("/search/#{query}")
      end
      
    end
    
  end
end
