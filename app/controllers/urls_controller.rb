class UrlsController < ApplicationController
  before_action :authentication
  before_action :search_url, only: [:show]

  #skip the authenticity token.
  skip_before_action :verify_authenticity_token

  def index
    #display all the data in the database.
    urls = Url.all
    render json: urls, status: :ok
  end

  def create
    #create a new record in the database.
    @url = Url.new(set_url_params)

    # generate random string and number and assign it to slug column in the database table.
    @url.slug = SecureRandom.hex(2)

    #this will trime only the https:// and www. from the url.
    # @url.website_name = URI.parse(@url.name).host

    #with the help of gsub methodwe can remove .com from the url.
    @url.website_name = URI.parse(@url.name).host.gsub(/(http:\/\/|https:\/\/|www\.|\.com)/, "")

    #if the url is not saved in the database then it will throw an error.
    if @url.save!
      render json: @url,
      status: :created
    else
      render json: {message: "Url not created"},
      status: :unprocessable_entity
    end
  end

  #display the details of the url in the show page.
  def show
      render json: @url,
      status: :ok
  end

  #top_url method is used to display the top 3 count urls in the database.
  def top_urls
    top_url = Url.order("count DESC").limit(3)
    render json: top_url
  end

  def top_level_domain
    #Only get the top level domains
  end

  # search method is used to search the url in the database.
  def search
    @searchUrl = Url.where("name LIKE ?", "%" + params[:s] + "%")
    if @searchUrl.present?
      render json: @searchUrl, status: :ok
    else
      render json: {message: "No record found"}
    end
  end

  private
# used to prevent the mass assignment vulnerability.
  def set_url_params
    params.require(:url).permit(:name)
  end

  def search_url
    #Url.find_by use for find the id of the url and display it in the show
    @url = Url.find_by(id: params[:id])
    if @url.blank?
      #if the url is not present in the database then it will show the error message in the console.
      render json: "Id not Present!"
    end
  end

end
