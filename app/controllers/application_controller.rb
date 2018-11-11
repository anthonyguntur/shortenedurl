require './config/environment'

class ApplicationController < Sinatra::Base

  register Sinatra::ActiveRecordExtension
  enable :sessions
  use Rack::Flash
  
  set :session_secret, "moneysmart"
  set :views, Proc.new { File.join(root, "../views/") }

  # User will go to homepage
  get '/' do
    erb :index
  end

  # HELPER METHODS
  helpers do
    # Find a shorten url based on original url
    def find_shorten_url(original_url)
      @shorten_url ||= Url.find_by(original_url: original_url.to_s)
    end

    # Find a original url based on shortcode
    def find_original_url(shortcode)
      @original_url ||= Url.find_by(shortcode: shortcode.to_s)
    end

    def smart_add_url_protocol(url)
      unless url[/\Ahttp:\/\//] || url[/\Ahttps:\/\//]
        @original_url = "http://#{url}"
      end
    end

    def random_string(length)
      rand(36**length).to_s(36)
    end
  end

end