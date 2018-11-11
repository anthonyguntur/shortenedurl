require 'useragent'

class RequestLogController < ApplicationController

  # GET the original url based on shortcode parameter
  get '/:shortcode' do 
    @ori = find_original_url(params[:shortcode])

    if @ori
        user_agent = UserAgent.parse(request.env["HTTP_USER_AGENT"])
        
        @request_log = RequestLog.new(shortcode: params[:shortcode].to_s, user_agent: user_agent.to_s, url_id: @ori.id)

        if @request_log.save()
          redirect "#{@ori.original_url}"
        else
          flash[:error] = "Request Log Failed"
          redirect to :"/"
        end
    else
        flash[:error] = "404 Not Found"
        redirect to :"/"
    end
  end

end