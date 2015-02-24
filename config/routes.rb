Rails.application.routes.draw do

  root 'actors#index'

  resources :actors

  resources :movies

  delete "/actors/:id/movies/:movie_id" => 'actors#remove_movie', as: :remove_movie

  delete "/movies/:id/actors/:actor_id" => 'movies#remove_actor', as: :remove_actor


=begin
Prefix Verb   URI Pattern                Controller#Action
      root GET    /                          actors#index
    actors GET    /actors(.:format)          actors#index
           POST   /actors(.:format)          actors#create
 new_actor GET    /actors/new(.:format)      actors#new
edit_actor GET    /actors/:id/edit(.:format) actors#edit
     actor GET    /actors/:id(.:format)      actors#show
           PATCH  /actors/:id(.:format)      actors#update
           PUT    /actors/:id(.:format)      actors#update
           DELETE /actors/:id(.:format)      actors#destroy
    movies GET    /movies(.:format)          movies#index
           POST   /movies(.:format)          movies#create
 new_movie GET    /movies/new(.:format)      movies#new
edit_movie GET    /movies/:id/edit(.:format) movies#edit
     movie GET    /movies/:id(.:format)      movies#show
           PATCH  /movies/:id(.:format)      movies#update
           PUT    /movies/:id(.:format)      movies#update
           DELETE /movies/:id(.:format)      movies#destroy
=end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
