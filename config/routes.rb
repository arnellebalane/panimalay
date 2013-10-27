Panimalay::Application.routes.draw do

  resources :sessions, :only => [:new, :create, :destroy]
  resources :account, :only => [:index, :show] do
    get :settings, :on => :collection
    get :accountabilities, :on => :collection
    get :photos, :on => :collection
    put :update, :on => :collection
  end
  resources :photos, :only => [:create] do
    post :get_photo, :on => :collection
    get :serve, :on => :member
  end
  resources :board, :only => [:index]
  # resources :users do
  resources :posts, :only => [:show, :create, :destroy]
  resources :comments, :only => [:create, :destroy]
  # end
  resources :announcements, :only => [:index, :create]
  resources :events, :only => [:index, :create]

  match "/gallery", :to => "photos#index", :as => "gallery"

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
  root :to => "sessions#new"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
