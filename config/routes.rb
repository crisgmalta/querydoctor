Rails.application.routes.draw do
  root to: 'root#index'

  namespace :api, as: nil do
  	namespace :v1, as: nil do
  	  resources :convenios
  	  resources :pacientes
  	  resources :especialidades
  	  resources :medicos
  	end
  end
end
