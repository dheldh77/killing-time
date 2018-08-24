Rails.application.routes.draw do
  # resources :real_story do 
  #   resources :real_story_reply
  # end
  # resources :real_story_reply

  devise_for :users
  root 'welcome#index'
  get '/welcome/index'
  
  resources :real_story do
    resources :real_story_reply
  end
  
  resources :real_story_reply
  
  # get 'bookmarks/bookmarks_toggle/:id', to: 'bookmarks#bookmarks_toggle'
  post 'bookmarks/bookmarks_toggle/:id', to: 'bookmarks#bookmarks_toggle', as: 'bookmarks'

  get 'welcome/user_data'
  
  # get 'likes/likes_toggle/:id' => 'likes#likes_toggle'
  post 'likes/likes_toggle/:id', to: 'likes#likes_toggle', as: "likes"
  
  get 'real_story/post/my_post', to: 'real_story#my_post'
  
  get 'real_story/post/search', to: 'real_story#search'
  
  get 'post/ajaxCall' => 'post#ajaxCall'

# real_story_routes
  # post 'real_story_reply/create'

  # get 'real_story_reply/destroy/:id' => 'real_story_reply#destroy'

  # get 'real_story/index'

  # get 'real_story/new'
  
  # post 'real_story/create'

  # post 'real_story/update/:id' => 'real_story#update'

  # get 'real_story/edit/:id' => 'real_story#edit'

  # get 'real_story/destroy/:id' => 'real_story#destroy'

  # get 'real_story/show/:id' => 'real_story#show'
  
  
  
  
  # get 'real_story/bookmark_search/:id', to: 'real_story#bookmark_search'
  
  

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
