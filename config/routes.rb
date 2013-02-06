Kukariri::Application.routes.draw do 
  devise_for :users, :path => "users", :path_names => { :sign_in => "login", :sign_up => "new_user" }

  scope do
    match "contacts" => "contacts#create", :via => "POST"
    match "contacts" => "contacts#index", :via => "GET"
    match "contacts/:id" => "contacts#show", :via => "GET"
    match "contacts/:id" => "contacts#update", :via => "PUT"
    match "contacts/:id" => "contacts#destroy", :via =>"DELETE"
  end
 
  scope do
    match "pictures" => "pictures#create", :via => "POST"
    match "pictures" => "pictures#index", :via => "GET"
    match "pictures/:id" => "pictures#show", :via => "GET"
    match "pictures/:id" => "pictures#update", :via => "PUT"
    match "pictures/:id" => "pictures#destroy", :via => "DELETE"
  end

  resources :items do
    resources :types do
      match "pictures/sort" => "pictures#update"
      resources :pictures
      resources :notifications
      resources :contacts do 
        resources :provided_dates
      end
    end 
  end


  scope do 
    match "countries/:name" => "countries#show", :via => "GET"
  end

  resources :google_contacts_to_contacts
  resources :countries, :except => [:show, :new, :edit, :create, :update, :destroy]
  resources :photos_to_pictures, :only => [:create]
  resources :attachments, :only => :create
  resources :translates, :only => :index

  root :to => "items#index"

  #devise_for :users, :path => "users", :path_names => { :sign_in => "login", :sign_up => "new_user" }

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
