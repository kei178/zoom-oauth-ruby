Rails.application.routes.draw do
  root 'zoom#index'

  get 'zoom/auth', to: 'zoom#auth'
end
