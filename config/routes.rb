Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/super_admin', as: 'rails_admin'

  resources :orders, only: [:create, :update]

  scope '(:country)' do
    scope '(:locale)' do
      get "p/", to: 'pipelines#index', via: :get
      get "p/:serial/:title", to: "pipelines#show", as: :page
      get "p/:serial", to: "pipelines#show", as: :pipeline

      match "/", to: 'pipelines#index', via: :get
    end
    match "/", to: 'pipelines#index', via: :get
  end

  root to: 'pipelines#index'
end
