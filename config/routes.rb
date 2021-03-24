Rails.application.routes.draw do

  namespace :api do
    resources :blogs do
      resources :posts
    end
##if going one more deep
      #resources :posts do
      #resources :comments
      #end
  end
end
