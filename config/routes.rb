Rails.application.routes.draw do
  root "pages#home"

  devise_for :users

  resources :quotes do
    resources :bundles, shallow: true, except: [:index, :show] do
      member do
        get 'items/new', to: 'bundle_items#new', as: 'new_item_for'
        post 'items', to: 'bundle_items#create', as: 'items_for'
      end
    end
  end

  resources :bundle_items, only: [:edit, :update, :destroy]
end

# == Route Map
#
#               Prefix Verb   URI Pattern                                                                                       Controller#Action
#                 root GET    /                                                                                                 pages#home
#     new_user_session GET    /users/sign_in(.:format)                                                                          devise/sessions#new
#         user_session POST   /users/sign_in(.:format)                                                                          devise/sessions#create
#                     destroy_user_session DELETE /users/sign_out(.:format)                                                     devise/sessions#destroy
#  new_item_for_bundle GET    /bundles/:id/items/new(.:format)                                                                  bundle_items#new
#     items_for_bundle POST   /bundles/:id/items(.:format)                                                                      bundle_items#create
#        quote_bundles POST   /quotes/:quote_id/bundles(.:format)                                                               bundles#create
#     new_quote_bundle GET    /quotes/:quote_id/bundles/new(.:format)                                                           bundles#new
#          edit_bundle GET    /bundles/:id/edit(.:format)                                                                       bundles#edit
#               bundle PATCH  /bundles/:id(.:format)                                                                            bundles#update
#                      PUT    /bundles/:id(.:format)                                                                            bundles#update
#                      DELETE /bundles/:id(.:format)                                                                            bundles#destroy
#               quotes GET    /quotes(.:format)                                                                                 quotes#index
#                      POST   /quotes(.:format)                                                                                 quotes#create
#            new_quote GET    /quotes/new(.:format)                                                                             quotes#new
#           edit_quote GET    /quotes/:id/edit(.:format)                                                                        quotes#edit
#                quote GET    /quotes/:id(.:format)                                                                             quotes#show
#                      PATCH  /quotes/:id(.:format)                                                                             quotes#update
#                      PUT    /quotes/:id(.:format)                                                                             quotes#update
#                      DELETE /quotes/:id(.:format)                                                                             quotes#destroy
#     edit_bundle_item GET    /bundle_items/:id/edit(.:format)                                                                  bundle_items#edit
#          bundle_item PATCH  /bundle_items/:id(.:format)                                                                       bundle_items#update
#                      PUT    /bundle_items/:id(.:format)                                                                       bundle_items#update
#                      DELETE /bundle_items/:id(.:format)                                                                       bundle_items#destroy
