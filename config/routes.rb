SwenGO::Application.routes.draw do

#------------------------------------

  root to: 'static_pages#home'

  match 'home/callback', to: 'users#create'

  match '/contact', to:  'static_pages#contact'
  match '/demo', to:  'static_pages#demo'
  match '/faq', to:  'static_pages#faq'

  match '/user/logout', to: 'users#logout'

  match '/friendships/find/', to: 'friendships#find'

  match '/tellme/text/:keywords', :to => 'memories#tellme'
  match '/tellme/data/:data', :to => 'memories#tellme_around'
  match '/tellme/friend/:title', :to => 'memories#tellme_friend'

  match '/getseniorname_by_id/:id', :controller => 'seniors', :action => 'getname_by_id'


  resources :cities
  resources :things
  resources :events

  resources :friendships

  #senior/memories
  resources :seniors do
      match '/timeline', :controller => 'memories', :action => 'timeline', :format => 'json'
      match '/preview', :controller => 'seniors', :action => 'preview'
      match '/tree', :controller => 'seniors', :action => 'tree'


      resources :memories do
      end
  end



  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
