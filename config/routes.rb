Myweb::Application.routes.draw do
  get 'log_out' => 'sessions#destroy', :as => 'log_out'
  get 'log_in' => 'sessions#new', :as => 'log_in'
  get 'sign_up' => 'users#new', :as => 'sign_up'

  resources :users
  resources :sessions
  resources :sites

  namespace :admin do
    constraints(Subdomain) do
      resources :pages
      resources :themes do
        member do
          get 'publish'
        end

        resources :assets, :shallow => true
        resources :stylesheets, :shallow => true, :controller => 'assets', :type => 'Stylesheet'
        resources :javascripts, :shallow => true, :controller => 'assets', :type => 'Javascript'
        resources :images, :shallow => true, :controller => 'assets', :type => 'Image'
        resources :templates, :shallow => true, :controller => 'assets', :type => 'Template'
      end
    end
  end

  root :to => 'home#index'
end
