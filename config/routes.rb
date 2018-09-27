Rails.application.routes.draw do
  get 'companies', to: 'companies#index'
  get 'companies/new', to: 'companies#new', as: :new_company
  get 'companies/:id', to: 'companies#show', as: :company
  post 'companies', to: 'companies#create'
  get 'companies/:id/edit', to: 'companies#edit', as: :edit_company
  patch 'companies/:id', to: 'companies#update'

  # get 'home/index'
  # get 'home/chuchu', to: 'home#index'
  root 'home#index'

  resources :addresses
  resources :phones
  resources :contacts
  resources :kinds, except: [:destroy]
  # resources(:kinds, {:except => [:destroy, :update, :edit]})

  resources :pets, only: [:index, :show, :new, :edit]
  # resources :people
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
