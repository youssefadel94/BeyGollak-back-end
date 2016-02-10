Rails.application.routes.draw do
  
  namespace :api, defaults: { format: :json } do  
    resources :user, only: [:index, :create] do
      member do
       get :show
       
       end 
    end
    resources :sessions, only: [:create, :delete]      
    resources :street, only: :index do
      member do
       get :show
       end 
    end
       resources :review, only: [:create, :index]
       resources :post, only: [:create, :index] do
          # get :test
         member do 
          get :show
          delete :delete
         end
       end
       resources :comment, only: [:create, :index] do
          # get :test
         member do 
         get :show
          delete :delete
         end
       end
       resources :notification, only: :index do
           member do
           get :seen
           get :show
           end
       end
       resources :friendship, only: [:index, :create]do
          # get :test
         member do 
          get :show
          delete :delete
         end
       end 
        end 
  
  get '' => 'street#index', as: :home
  get '/streets' => 'street#index', as: :streets
  get '/streets/:id' => 'street#show', as: :street
  
  get 'review/new/:id' =>  'review#new', as: :review_new
  
  post 'review' => 'review#create', as: :reviews 
  
  get 'review/delete/:id' =>  'review#delete', as: :review_delete
  
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
