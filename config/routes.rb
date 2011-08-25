Myweb::Application.routes.draw do
  resources :sites

  namespace :admin do
    constraints(Subdomain) do
      resources :pages
      resources :themes do
        member do
          post 'publish'
        end

        resources :assets, :shallow => true
        resources :stylesheets, :shallow => true, :controller => 'assets', :type => 'Stylesheet'
        resources :javascripts, :shallow => true, :controller => 'assets', :type => 'Javascript'
        resources :images, :shallow => true, :controller => 'assets', :type => 'Image'
        resources :templates, :shallow => true, :controller => 'assets', :type => 'Template'
      end
    end
  end

  devise_for :users

  root :to => 'sites#index'
end
