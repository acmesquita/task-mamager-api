Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #Configurando a rota para ser acessada assim: api.site.com/controller
  # subdomain -> adicionar 'api' no inicio do site
  # path -> '/' defini que deve ser inforamado o nome do controller logo após o '.com' 
  namespace :api, defaults: { format: :json }, contraints: { subdomain: 'api'}, path: '/'  do
    

  end
end
