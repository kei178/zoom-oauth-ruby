Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'zoom', to: 'zoom#index'
  get 'zoom/auth', to: 'zoom#auth'
end
