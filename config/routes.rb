Rails.application.routes.draw do
  root "pages#home"

  devise_for :users

  resources :quotes do
    resources :bundles, shallow: true, except: [:index, :show]
  end
end
