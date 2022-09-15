class RedirectsController < ApplicationController
  #before_action :count, only: :index
  def index
    url = Url.find_by!(slug: params[:url_id])
    url.count += 1
    url.save!
    puts "--------------"
    puts url.name
    redirect_to url.name, allow_other_host: true
    
  end
end
  # def clickcountplusone
  #   @url = Url.find(params[:id])
  #   @url.update_attribute(:Url => @url.count + 1)
  # end

  # # def update
  # #   @url = Url.find(params[:id])
  # #   @url.increment_counter
  # #   render json: @url
  # # end

  # def show
  #   @url = Url.find(params[:id])
  #   Url.increment_counter(@url.id)
  # end


