class RedirectsController < ApplicationController

  def index
    url = Url.find_by!(slug: params[:url_id])
    puts "--------------"
    puts url.name
    redirect_to url.name, allow_other_host: true
  end

end
