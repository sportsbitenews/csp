Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/super_admin', as: 'rails_admin'

  scope '(:country)' do
    scope '(:locale)' do
      get "p/:serial/:title", to: "pipelines#show", as: :page
      get "p/:serial", to: "pipelines#index"

      match "/", to: 'pipelines#index', via: :get
    end
    match "/", to: 'pipelines#index', via: :get
  end

  root to: 'pipelines#index'
end
