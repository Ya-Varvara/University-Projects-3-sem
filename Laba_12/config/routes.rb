Rails.application.routes.draw do
  resources :users
  get 'session/login'
  post 'session/create'
  get 'session/logout'
  get 'armst/input'
  get 'armst/view'
  root to: 'armst#input'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
