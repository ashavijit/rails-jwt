Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  Resources :users, param: :_username
  post 'auth/login', to: 'authentication#authenticate'
  get '/*a', to: 'application#not_found
end
