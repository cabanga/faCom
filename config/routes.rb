Rails.application.routes.draw do
  resources :funcionarios
  resources :registos
  devise_for :usuarios

  resources :usuarios

  resources :empresas
  resources :cidades
  get 'home/index'
  root "home#index"

  patch 'registos/:id/aprovar_registo' => 'registos#aprovar_registo', as: 'aprovar_registo'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
