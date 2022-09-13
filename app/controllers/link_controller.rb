class LinkController < ApplicationController

  before_save :search_url, only: [:show]
  skip_before_action :verify_authenticity_token

  def index
    @url = Url.new
  end

  def create
    @url = Url.new(set_url_params)
    begin
      if @url.save!
        format json: { url: @url.short_url },
        status: :created
      end
    rescue => e
      format json: { error: e.message },
      status: :unprocessable_entity
    end
  end

  def show
    begin
      render json: { url: @url.short_url },
      status: :ok
    rescue => exception
      render json: { error: exception.message },
      status: :unprocessable_entity
    end
  end

  private

  def set_url_params
    params.require(:url).permit(:url)
  end

  def search_url
    @url = Url.find_by(slug_url: params[:slug])
    if @url.blank?
      render json: "error!"
  end

end
