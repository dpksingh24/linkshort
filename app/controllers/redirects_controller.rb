class RedirectsController < ApplicationController
  # skip_before_action :verify_authenticity_token

  def index
    @url = Url.find_by!(slug: params[:slug]).name
    redirect_to @url, allow_other_host: true
  end

end
