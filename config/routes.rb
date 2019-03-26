Rails.application.routes.draw do
  
  root 'homepage#index'
  # , constraints: { ip: /66.8.136.227/ }

  # resources :kroger
  # resources :savingstar
  # resources :targetcoupon
  
  # get 'stores/albertsons'
  get 'stores/everywhere/:store' => 'stores#everywhere#:store'
  # get 'stores/heb'
  # get 'stores/hyvee'
  # get 'stores/kroger'
  # get 'stores/meijer'
  # get 'stores/walmart'
  
  get 'homepage/stores'
  
  get 'homepage/deleteall'
  
  get 'doublesavers/show'
  get 'doublesavers/save'
  get 'doublesavers/delete'
  
  get 'smith2/save'
  get 'smith2/delete'
  get 'smith2/show'
  
  get 'albertson/save'
  get 'albertson/show'
  get 'albertson/delete'
  
  get 'hyvee/save'
  get 'hyvee/show'
  get 'hyvee/delete'
  
  get 'meijer/save'
  get 'meijer/show'
  get 'meijer/delete'
  
  get 'heb/save'
  get 'heb/show'
  get 'heb/delete'
  
  get 'publix/save'
  get 'publix/show'
  get 'publix/delete'
  
  get 'savingstar/save'
  get 'savingstar/show'
  get 'savingstar/delete'
  
  get 'smiths/save'
  get 'smiths/show'
  get 'smiths/delete'
  
  get 'checkout51/save'
  get 'checkout51/show'
  get 'checkout51/delete'
  
  get 'savingstar/save'
  get 'savingstar/show'
  get 'savingstar/delete'
  
  get 'targetcoupon/save'
  get 'targetcoupon/show'
  get 'targetcoupon/delete'
  
  get 'ibotta/save'
  get 'ibotta/show'
  get 'ibotta/delete'
  
  get 'kroger/save'
  get 'kroger/show'
  get 'kroger/delete'
  
  
  
  
  
  
  get 'homepage/mastersave'
  get 'homepage/mastersave/:store' => "homepage#mastersave#:store"
  
  get 'homepage/ibottashow/:store' => "homepage#ibottashow#:store"
  get 'homepage/ibottasave/:store' => "homepage#ibottasave#:store"
  get 'homepage/ibottadelete/:store' => "homepage#ibottadelete#:store"
  
  get 'homepage/singleshow/:store' => "homepage#singleshow#:store"
  get 'homepage/singledelete/:store' => "homepage#singledelete#:store"
  
  get 'homepage/alltimesave'
  get 'homepage/alltimeshow'
  get 'homepage/alltimedelete'
  
  get 'checkout51/save'
  get 'targetcoupon/save'
  
  resources :smith2
  resources :ibotta
  resources :albertson
  resources :checkout51
  resources :heb
  resources :hyvee
  resources :meijer
  resources :publix
  resources :savingstar
  resources :targetcoupon

  resources :krogertargetcoupon
  resources :krogercheckout51
  resources :krogersavingstar
  resources :checkout51targetcoupon
  resources :checkout51savingstar
  resources :targetcouponsavingstar
  resources :krogeribotta
  resources :ibottacheckout51
  resources :ibottasavingstar
  resources :targetibottum
  resources :doublesavers
  resources :triplesave
  
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
