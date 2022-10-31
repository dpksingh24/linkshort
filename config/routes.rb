Rails.application.routes.draw do


  resources :users, only: [:index, :show]

  namespace :api do
    namespace :v1 do
      root "urls#index"
      get 'status' => "status#index"
      get '/:url_id' => "redirects#redirect"
      resources :urls, only: [:create, :show, :index, :destroy] do
        collection do
          get :top_urls
          get :top_level_domain
        end
      end
    end
  end

end
