Rails.application.routes.draw do
  get 'portal/index'

  resources :facturas
  resources :funcionarios
  resources :registos
  devise_for :usuarios
  resources :usuarios
  resources :empresas
  resources :cidades

  resources :facturas do
    resources :item_facturas
  end

  patch 'funcionarios/:id/tornar_usuario' => 'funcionarios#tornar_usuario', as: 'tornar_usuario'

  resources :empresas do
    resources :tipos_de_impostos
    patch 'tipos_de_impostos/:id/activar_e_desactivar' => 'tipos_de_impostos#activar_e_desactivar', as: 'activar_e_desactivar'
    resources :tipos_de_descontos

    resources :tipos_de_descontos do
      patch 'tipos_de_descontos/:id/activar_e_desactivar' => 'tipos_de_descontos#activar_e_desactivar', as: 'activar_e_desactivar'
    end

  end

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
