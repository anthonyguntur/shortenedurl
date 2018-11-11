class UrlController < ApplicationController    
  # CREATE a shorten url based on form information
  post '/shorten' do
    @shorten_url = find_shorten_url(smart_add_url_protocol(params[:original_url]))

    if @shorten_url
      flash[:success] = @shorten_url.shorten_url
      redirect to "/"
    else
      original_url = smart_add_url_protocol(params[:original_url].to_s)
      shortcode = random_string(5)
      shorten_url = request.base_url + '/' + shortcode
      @url = Url.new(original_url: original_url.to_s, shorten_url: shorten_url.to_s, shortcode: shortcode.to_s)
      
      if @url.save()
          flash[:success] = shorten_url
          redirect to "/"
      else
          flash[:error] = "Please ensure you have filled in all required fields correctly!"
          redirect to "/"
      end
    end
  end

end