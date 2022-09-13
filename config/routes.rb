Rails.application.routes.draw do

  root "page#index"
  get 'r', to: 'redirects#index'
  resources :urls, only: :create

  # namespace :controllers do
  #   resources :url do
  #     resources :slug_url
  #   end
  #     resources :slug_url
  # end

end
