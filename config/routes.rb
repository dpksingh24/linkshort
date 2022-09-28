Rails.application.routes.draw do

  root "urls#index"
  get '/:url_id' => "redirects#redirect"

  # resources :users, only: [:index, :show]
  get '/users' => "users#index"
  get '/users/:id' => "users#show"


  resources :urls, only: [:create, :show, :index] do
    collection do
      get :top_urls
      # get :search
      get :top_level_domain
    end
  end

end
