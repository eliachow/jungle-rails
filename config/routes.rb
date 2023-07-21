Rails.application.routes.draw do

  # sets the root URL of app to the index action of the ProductsController.
  root to: 'products#index'

  # :products sets up RESTful routes for the products resource, allowing you to perform index and show actions. It generates routes such as /products for the index and /products/:id for the show action.
  # :categories sets up a RESTful route for the categories resource, allowing you to perform the show action. It generates a route such as /categories/:id to show a specific category.
  resources :products, only: [:index, :show]
  resources :categories, only: [:show]

  # sets up a singular RESTful route for the cart resource, allowing you to perform the show action. It generates a route such as /cart to display the cart.
  # post :add_item and post :remove_item: These define additional routes within the cart resource for the add_item and remove_item actions. They handle the addition and removal of items from the cart, respectively.
  resource :cart, only: [:show] do
    post   :add_item
    post   :remove_item
  end

  # This sets up RESTful routes for the orders resource, allowing you to create new orders (create action) and view order details (show action).
  resources :orders, only: [:create, :show]

  # This creates a namespace for admin-related routes. All routes defined within this block will be prefixed with /admin.
  # root to: 'dashboard#show': This sets the root URL for the admin namespace to the show action of the DashboardController. When you visit /admin, it will display the admin dashboard.
  # resources :products, except: [:edit, :update, :show]: This sets up RESTful routes for the products resource within the admin namespace, excluding the edit, update, and show actions. It generates routes for index, new, create, and destroy within the admin namespace.
  namespace :admin do
    root to: 'dashboard#show'
    resources :products, except: [:edit, :update, :show]
    resources :categories, only: [:index, :new, :create]
  end

  # This creates a custom route for the about page, mapping the /about URL to the index action of the AboutController. When you visit /about, it will display the about page.
  get 'about', to: 'about#index'

  # these routes are for showing users a login form, logging them in, and logging them out.
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  # These routes will be for signup. The first renders a form in the browse, the second will 
  # receive the form and create a user in our database using the data given to us by the user.
  get '/signup' => 'users#new'
  post '/users' => 'users#create'


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
