Rails.application.routes.draw do

  root "urls#index"
  get '/:url_id' => "redirects#redirect"

  # resources :users, only: [:index, :show]

  resources :urls, only: [:create, :show, :index] do
    collection do
      get :top_urls
      # get :search
      get :top_level_domain
    end
  end

end
