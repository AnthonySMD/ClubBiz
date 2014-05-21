ClubBiz::Application.routes.draw do
  get "clubs/index"
  get "tickets/new"
  post "tickets/new", to: 'events#show'
  get "tickets/purchase"
  get "clubs/my"
  resources :clubs
  #get "clubs/:id", to: 'clubs#show'
  post "clubs/:id", to: 'clubs#join'
  get "events/my"
  resources :events
  #get "events/:id", to: 'events#show', as: :event
  get "events/:id/purchase_ticket", to: 'events#purchase_ticket', as: :purchase_ticket
  get "events/:id/unattend", to: 'events#unattend', as: :unattend
  devise_for :users
  resources :users, only: [:index]
  get "users/add_admin"
  get "main/landing"
  get "main/home"
 


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  root to: "main#landing"

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
