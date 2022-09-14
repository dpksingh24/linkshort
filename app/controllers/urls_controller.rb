class UrlsController < ApplicationController

  before_action :search_url, only: [:show]
  skip_before_action :verify_authenticity_token

  def index
    # if params[:user_id].present?
    #   url = Url.where(slug: params[:url_id])
    #   puts "--------------"
    #   puts url.name
    #   redirect_to url.name, allow_other_host: true
    # else
      urls = Url.all
      render json: urls, status: :ok
    # end
  end

  def create
    @url = Url.new(set_url_params)
    begin
      if @url.save!
        render json: @url,
        status: :created
      end
    rescue => exception
      render json: {error: exception.message},
      status: :unprocessable_entity
    end
  end

  def show
    begin
      render json: @url,
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
    if @url.blank?
      render json "Id not Present!"
    end
  end

end
