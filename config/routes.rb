Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/super_admin', as: 'rails_admin'

  scope '(:country)' do
    scope '(:locale)' do
      get "p/:serial/:title", to: "pipelines#show", as: :page, defaults: { serial: "1", title: "landing" }
      get "p/:serial", to: "pipelines#index", defaults: { serial: "1" }
    end
  end
end
