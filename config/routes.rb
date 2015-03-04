Rails.application.routes.draw do



  root                'static_pages#home'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  post   'upload'   => 'static_pages#upload'
  delete 'logout'  => 'sessions#destroy'
  get    'dashboard'    => 'static_pages#dashboard'
  get    'charts'    => 'static_pages#charts'
  get    'buttons'    => 'static_pages#buttons'
  get    'table'    => 'static_pages#table'
  get    'notifications'    => 'static_pages#notifications'
  get    'image-gallery'    => 'static_pages#image-gallery'
  get    'form-controls'    => 'static_pages#form-controls'
  get    'gallery-with-filter'    => 'static_pages#gallery-with-filter'
  get    'typography'    => 'static_pages#typography'
  
  get    'table_philum'    => 'static_pages#table_phi'
  get    'table_class'    => 'static_pages#table_cla'
  get    'table_order'    => 'static_pages#table_ord'
  get    'table_family'    => 'static_pages#table_fam'
  get    'table_genus'    => 'static_pages#table_gen'
  get    'table_species'    => 'static_pages#table_spi'
  get    'paziente'    => 'static_pages#table_paz'

#  get '/dsb', :to => redirect('template_html/dashboard.html')
  resources :users
  resources :datasets


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
