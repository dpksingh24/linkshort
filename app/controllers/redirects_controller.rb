class RedirectsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @url = Url.find_by!(slug_url: params[:slug]).url
    redirect_to @url, allow_other_host: true
  end

end



# if params[:user_id].present?
#   @articles = Article.where(user_id: params[:user_id])
# else
