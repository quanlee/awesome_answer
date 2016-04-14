Rails.application.routes.draw do

  # This defines a route so that when we recieve a GET request with url: /home
  # Rails will invoke the WelcomeController with 'index' action
  get "/home" => "welcome#index"

  get "/about" => "welcome#about", as: :about_us

# this defines the 'root' or homepage of our application to go to the WelcomeController
# with 'index' action. we will have access to the helper methods: root_path and root_url
  get '/hello/:name/test' => "welcome#index"
  root 'welcome#index'

  get "/contact_us" => "contact_us#new"


  post "/contact_us" => "contact_us#create"

  get  "/questions/new" => "questions#new"
  post "/questions" => "questions#create", as: :questions
  get  "/questions/:id" => "questions#show", as: :question
  get  "/questions" => "questions#index"
  get  "/questions/:id/edit" => "questions#edit",  as: :edit_question

  # delete "/questions/:id" => "questions#destroy"
  # get "/questions/:id/edit" => "questions#edit"
  # get "/questions/:id" => "questions#show"
  # post "/questions/:id/comments" => "comments#create"
  # get "/faq" => "home#faq"
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
