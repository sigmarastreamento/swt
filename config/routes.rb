Swt::Application.routes.draw do
	
  	resources :users_devices

  	resources :user_settings

  	resources :positions

  	resources :devices
	#get 'devices/novo', to: 'devices#new'

	resources :application_settings

	devise_for :users, :controllers => {:registration => "registrations"}
	
	
	
#	devise_for :users, :skip => [ :session, :registrations, :passwords ] do

		# devise/sessions
#		get 'entrar' => 'devise/sessions#new', :as => :new_usuario_session
#		post 'entrar' => 'devise/sessions#create', :as => :usuario_session
#		delete 'sair' => 'devise/sessions#destroy', :as => :destroy_usuario_session
	
		# devise/registrations
#		get 'cadastro' => 'devise/registrations#new', :as => :new_usuario_registration
#		post 'cadastro' => 'devise/registrations#create', :as => :usuario_registration
#		get 'cadastro/cancelar' => 'devise/registrations#cancel', :as => :cancel_usuario_registration
#		get 'cadastro/alterar' => 'devise/registrations#edit', :as => :edit_usuario_registration
#		put 'cadastro' => 'devise/registrations#update'
#		delete 'cadastro/cancelar' => 'devise/registrations#destroy'
	
		# devise/passwords
#		post 'senha' => 'devise/passwords#create', :as => :usuario_password
#		get 'senha/nova' => 'devise/passwords#new', :as => :new_usuario_password
#		get 'senha/alterar' => 'devise/passwords#edit', :as => :edit_usuario_password
#		put 'senha' => 'devise/passwords#update'

#	end
	
	resources :users	
	root :to => 'home#index'	
	
	
	
	#authenticated :user do
	#	root to: "home#index", as: :authenticated_root
	#end
	#unauthenticated do
	#	root to: "home#index", as: :unauthenticated_root
	#end	
	
	
	
	
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
