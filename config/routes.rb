Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get 'user/admin'
  get 'user/user', to: 'user#user'
  get 'user', to: 'user#user'


  get 'coma/index'
  get 'coma', to: 'coma#index'
  get 'coma/add'
  get 'coma/edit/:id', to: 'coma#edit'
  patch 'coma/edit/:id/:user', to: 'coma#edit'
  get 'coma/regist/:coma/:band', to: 'coma#regist'
  get 'coma/delete'
  get 'coma/destroy'
  get 'coma/buhi'
  get 'coma/buhi/:month', to: 'coma#buhi_show'
  get 'coma/admin'
  get 'coma/admin_edit/:id', to: 'coma#admin_edit'


  get 'band/index'
  get 'band', to: 'band#index'
  get 'band/add'
  post 'band/add', to: 'band#create'
  get 'band/edit/:id', to: 'band#edit'
  patch 'band/edit/:id', to: 'band#update'
  get 'band/delete/:id', to: 'band#delete'
  post 'band/delete/:id', to: 'band#delete'
  get 'band/admin'
  get 'band/:id', to: 'band#show'

end
