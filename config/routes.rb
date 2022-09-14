Rails.application.routes.draw do

  # root "redirects#index"
  get '/:url_id' => "redirects#index"
  resources :urls, only: [:create, :show, :index]

  # namespace :controllers do
  #   resources :url do
  #     resources :slug
  #   end
  #     resources :slug
  # end

end
