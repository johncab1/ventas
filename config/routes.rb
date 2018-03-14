Rails.application.routes.draw do
  get 'cajas/index'

  get 'cajas/cobrar'

  resources :entradas
  resources :articulos
  resources :cajas
  devise_for :users
  
  get 'dashboard/index'
  post 'cajas/cobrar'
  root 'dashboard#index'
   
  match '/articulos' => 'articulos#index', via: :post
  match '/caja' => 'cajas#index', via: [:get, :post]
  match '/ventas' => 'cajas#ventas', via: :get
  match '/cobrar' => 'cajas#cobrar', via: :post
  match '/sale/:id' => 'cajas#show', via: [:get, :post], :as => "sale"
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
