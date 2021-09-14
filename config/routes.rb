Rails.application.routes.draw do
  get 'zoom/auth', to: 'zoom#auth'
end
