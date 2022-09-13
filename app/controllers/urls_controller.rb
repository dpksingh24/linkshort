class UrlsController < ApplicationController

  before_action :search_url, only: [:show]
  skip_before_action :verify_authenticity_token

  def index
    @urls = Url.all
    render json: @urls, status: :ok
  end

  def create
    @url = Url.new(set_url_params)
    if @url.save!
      render json: @url.shorturl , status: :created
    else
      render json: @url.errors, status: :unprocessable_entity
    end
  end

  def show
    begin
      render json: @url.shorturl,
      status: :ok
    rescue => exception
      render json: { error: exception.message },
      status: :unprocessable_entity
    end
  end

  private

  def set_url_params
    params.require(:url).permit(:name)
  end

  def search_url
    @url = Url.find_by!(id: params[:id])
  end

end
