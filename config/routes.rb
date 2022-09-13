Rails.application.routes.draw do

  root "links#index"
  get 'r', to:'redirects#index'
  resources :urls

  # namespace :controllers do
  #   resources :url do
  #     resources :slug_url
  #   end
  #     resources :slug_url
  # end

end
