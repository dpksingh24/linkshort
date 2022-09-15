Rails.application.routes.draw do

  root "urls#index"
  get '/:url_id' => "redirects#redirect"
  resources :urls, only: [:create, :show, :index] do
    collection do
      get :top_urls
    end
  end

end
