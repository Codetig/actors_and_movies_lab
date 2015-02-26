Rails.application.routes.draw do

  get 'users/signup'

  get 'users/login'

resources :movies do
  post '/comments', to: 'comments#create'
# delete '/comments/:id', to: 'comments#destoy'
end
resources :actors do
  post '/comments', to: 'comments#create'
end

  # resources :movies do
  #   resources :comments, shallow: true
  # end
  # resources :actors do
  #   resources :comments, shallow: true
  # end

  post '/movies/:id/actors/new' => 'movies#add_actor', as: :add_actor
  delete 'movies/:id/actors/:actor_id' => 'movies#remove_actor', as: :remove_actor

  post '/actors/:id/movies/new' => 'actors#add_movie', as: :add_movie
  delete '/actors/:id/movies/:movie_id' => 'actors#remove_movie', as: :remove_movie

  get '/users/new', to: "users#signup", as: :signup
  get '/users/login', to: "users#login", as: :login
  get '/users/logout', to: "users#logout", as: :logout
  post '/users/new' => 'users#create', as: :add_user
  post '/users/login' => 'users#attempt_login', as: :signin

  root 'site#index'

=begin
  Prefix Verb   URI Pattern                              Controller#Action
   comments_index GET    /comments/index(.:format)                comments#index
   movie_comments GET    /movies/:movie_id/comments(.:format)     comments#index
                  POST   /movies/:movie_id/comments(.:format)     comments#create
new_movie_comment GET    /movies/:movie_id/comments/new(.:format) comments#new
     edit_comment GET    /comments/:id/edit(.:format)             comments#edit
          comment GET    /comments/:id(.:format)                  comments#show
                  PATCH  /comments/:id(.:format)                  comments#update
                  PUT    /comments/:id(.:format)                  comments#update
                  DELETE /comments/:id(.:format)                  comments#destroy
           movies GET    /movies(.:format)                        movies#index
                  POST   /movies(.:format)                        movies#create
        new_movie GET    /movies/new(.:format)                    movies#new
       edit_movie GET    /movies/:id/edit(.:format)               movies#edit
            movie GET    /movies/:id(.:format)                    movies#show
                  PATCH  /movies/:id(.:format)                    movies#update
                  PUT    /movies/:id(.:format)                    movies#update
                  DELETE /movies/:id(.:format)                    movies#destroy
   actor_comments GET    /actors/:actor_id/comments(.:format)     comments#index
                  POST   /actors/:actor_id/comments(.:format)     comments#create
new_actor_comment GET    /actors/:actor_id/comments/new(.:format) comments#new
                  GET    /comments/:id/edit(.:format)             comments#edit
                  GET    /comments/:id(.:format)                  comments#show
                  PATCH  /comments/:id(.:format)                  comments#update
                  PUT    /comments/:id(.:format)                  comments#update
                  DELETE /comments/:id(.:format)                  comments#destroy
           actors GET    /actors(.:format)                        actors#index
                  POST   /actors(.:format)                        actors#create
        new_actor GET    /actors/new(.:format)                    actors#new
       edit_actor GET    /actors/:id/edit(.:format)               actors#edit
            actor GET    /actors/:id(.:format)                    actors#show
                  PATCH  /actors/:id(.:format)                    actors#update
                  PUT    /actors/:id(.:format)                    actors#update
                  DELETE /actors/:id(.:format)                    actors#destroy
        add_actor POST   /movies/:id/actors/new(.:format)         movies#add_actor
     remove_actor DELETE /movies/:id/actors/:actor_id(.:format)   movies#remove_actor
        add_movie POST   /actors/:id/movies/new(.:format)         actors#add_movie
     remove_movie DELETE /actors/:id/movies/:movie_id(.:format)   actors#remove_movie
             root GET    /                                        site#index
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
