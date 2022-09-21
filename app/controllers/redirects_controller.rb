class RedirectsController < ApplicationController

  require "net/http"

  def redirect
    #find the slug of the url and display it in the show page.
    @url = Url.find_by(slug: params[:url_id])

    if @url.present?
      #count the number of times the url is clicked.
      @url.count += 1
      @url.save!

      urlCheck = URI.parse(@url.name)
      req = Net::HTTP.new(urlCheck.host, urlCheck.port)
      req.use_ssl = true
      path = urlCheck.path if urlCheck.path.present?

      #error =>SSL_connect returned=1 errno=0 peeraddr=188.214.128.77:443 state=error: certificate verify failed (Hostname mismatch)
      res = req.request_head(path || '/')

      if res.code == "200"
        redirect_to @url.name,
        allow_other_host: true,
        status: :ok
      else
        render json: {message: "Url not found"}, status: :unprocessable_entity
      end

    end
  end

end

