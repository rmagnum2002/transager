Rails.application.routes.draw do

  get 'posts/carrier'

  resources :parts, only: [:index] do
    collection do
      get :tires
    end
  end

  resources :feedbacks

  mount Ckeditor::Engine => '/ckeditor'
  resources :pages

  resources :contacts

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  scope "(:lang)", locale: /ro|en|ru/ do
    get '/transport' => 'welcome#transport', as: :transports
    get '/transport/:id' => 'welcome#transport', as: :transport
    get '/service' => 'welcome#service', as: :services
    get '/service/:id' => 'welcome#service', as: :service
    get '/shop' => 'welcome#shop', as: :shops
    get '/shop/:id' => 'welcome#shop', as: :shop
    get '/contacts' => 'welcome#contacts'

    get '/intern.html' => redirect('/ro/transport/national')
    get '/maritim.html' => redirect('/ro/transport/maritime')
    get '/transport-internaional.html' => redirect('/ro/transport/international')
    get '/service-autocamioane.html' => redirect('/ro/service/truck-service')
    get '/service-remorci-i-semiremorci.html' => redirect('/ro/service/truck-service')
    get '/tractarea-autocamioanelor.html' => redirect('/ro/service/tow-truck')
    get '/contact.html' => redirect('/contacts')
  end

  get '/parts/pdf' => 'parts#parts_list', as: :parts_list
  get '/search_parts' => 'parts#autocomplete'
  get 'career/:id' => 'posts#career', as: :carrier
  get '/careers' => 'posts#careers'
  get 'set_locale' => 'welcome#set_locale'

  get '/:locale' => 'welcome#index'
  root 'welcome#index'


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
