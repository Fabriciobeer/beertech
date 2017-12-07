Rails.application.routes.draw do
  resources :receita
  resources :materiaprimas
  resources :users
  resources :clientes, except: [:new]
  resources :estoquefinals do
    collection do
      get 'set_item_name'
    end
  end
  resources :estoquemps, except: [:edit]
  resources :pagamentos
  resources :items
  resources :ciclovidas do
    collection do
      get 'set_item_data'
    end
  end
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'sessions#new'
  get 'plainpage/index', to: 'plainpage#index'
  get 'plainpage/index2', to: 'plainpage#index2'
  get 'plainpage/index3', to: 'plainpage#index3'
  get 'plainpage/form', to: 'plainpage#form'
  get 'plainpage/form_advanced', to: 'plainpage#form_advanced'
  get 'plainpage/form_validation', to: 'plainpage#form_validation'
  get 'plainpage/form_wizard', to: 'plainpage#form_wizard'
  get 'plainpage/form_upload', to: 'plainpage#form_upload'  
  get 'plainpage/form_buttons', to: 'plainpage#form_buttons'  
  get 'plainpage/general_elements', to: 'plainpage#general_elements'
  get 'plainpage/media_gallery', to: 'plainpage#media_gallery'
  get 'plainpage/typography', to: 'plainpage#typography'
  get 'plainpage/icons', to: 'plainpage#icons'
  get 'plainpage/glyphicons', to: 'plainpage#glyphicons'
  get 'plainpage/widgets', to: 'plainpage#widgets'
  get 'plainpage/invoice', to: 'plainpage#invoice'
  get 'plainpage/inbox', to: 'plainpage#inbox'
  get 'plainpage/calendar', to: 'plainpage#calendar'
  get 'plainpage/tables', to: 'plainpage#tables'
  get 'plainpage/tables_dynamics', to: 'plainpage#tables_dynamics'
  get 'plainpage/chartjs', to: 'plainpage#chartjs'
  get 'plainpage/chartjs2', to: 'plainpage#chartjs2'
  get 'plainpage/morisjs', to: 'plainpage#morisjs'
  get 'plainpage/echarts', to: 'plainpage#echarts'
  get 'plainpage/other_charts', to: 'plainpage#other_charts'
  
  get 'saidamp', to: 'estoquemps#edit'
  get 'estoquemps/saida', to: 'estoquemps#saida'
  get 'signup', to: 'clientes#new'
  get 'criarsegundouser', to: 'users#new2'
  
 # get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get 'analise1', to: 'estoquemps#analise1'
  get 'analise2', to: 'estoquefinals#analise2'
  get 'analise3', to: 'ciclovidas#analise3'

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
