class RedirectsController < ApplicationController

  #find the slug of the url and display it in the show page.ß
  def redirect
    @url = Url.find_by(slug: params[:url_id])
    @url.count += 1
    @url.save!
    redirect_to @url.name, allow_other_host: true
  end

end

