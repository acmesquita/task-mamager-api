load './lib/tasks/api_version_constraint.rb'

Rails.application.routes.draw do
  devise_for :users, only: [:sessions], controllers: {sessions: 'api/v1/sessions'}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #Configurando a rota para ser acessada assim: api.site.com/controller
  # subdomain -> adicionar 'api' no inicio do site
  # path -> '/' defini que deve ser inforamado o nome do controller logo após o '.com' 
  namespace :api, defaults: { format: :json }, contraints: { subdomain: 'api'}, path: '/'  do
    namespace :v1, path: '/', constraints: ApiVersionConstraint.new(version: 1, default: false) do
        resources :users, only: [:show, :create, :update, :destroy]
        resources :sessions, only: [:create, :destroy]
        resources :tasks, only: [:index, :show, :create, :update, :destroy]
    end
    namespace :v2, path: '/', constraints: ApiVersionConstraint.new(version: 2, default: true) do
      mount_devise_token_auth_for 'User', at: 'auth'
  
      resources :users, only: [:show, :create, :update, :destroy]
      resources :sessions, only: [:create, :destroy]
      resources :tasks, only: [:index, :show, :create, :update, :destroy]
    end
  end
end
