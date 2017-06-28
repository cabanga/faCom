Rails.application.routes.draw do
  resources :facturas
  resources :funcionarios
  resources :registos
  devise_for :usuarios
  resources :usuarios
  resources :empresas
  resources :cidades

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'


  get 'home/index'
  root "home#index"

  patch 'registos/:id/aprovar_registo' => 'registos#aprovar_registo', as: 'aprovar_registo'
  patch 'empresas/:id/activar_e_desactivar' => 'empresas#activar_e_desactivar', as: 'activar_e_desactivar'
  patch 'facturas/:id/pagar_factura' => 'facturas#pagar_factura', as: 'pagar_factura'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
