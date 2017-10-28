load './lib/tasks/api_version_constraint.rb'

Rails.application.routes.draw do
  # devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #Configurando a rota para ser acessada assim: api.site.com/controller
  # subdomain -> adicionar 'api' no inicio do site
  # path -> '/' defini que deve ser inforamado o nome do controller logo após o '.com' 
  namespace :api, defaults: { format: :json }, contraints: { subdomain: 'api'}, path: '/'  do
    namespace :v1, path: '/', contraints: ApiVersionConstraint.new(version: 1, default: true) do
        resources :users, only: [:show, :create]
    end
  end
end
