Rails.application.routes.draw do

  root "urls#index"
  get '/:url_id' => "redirects#redirect"
  get 'status' => "status#index"

  resources :users, only: [:index, :show]

  resources :urls, only: [:create, :show, :index, :destroy] do
    collection do
      get :top_urls
      get :top_level_domain
    end
  end

end
