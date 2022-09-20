class RedirectsController < ApplicationController

  def redirect
    #find the slug of the url and display it in the show page.
    @url = Url.find_by(slug: params[:url_id])

    if @url.present?
      #count the number of times the url is clicked.
      @url.count += 1
      @url.save!
      #redirect to the url name.
      redirect_to @url.name, allow_other_host: true
    else
      render json: "error!"
    end
  end

end
