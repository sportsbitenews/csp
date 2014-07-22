RailsAdmin.config do |config|
  config.authorize_with do
    require_http_admin
  end

  config.main_app_name = ['CSP', 'Super Admin panel']

  require 'rack'
  config.model ActiveRecord::SessionStore::Session do
    field :id
    field :session_id

    field :data do
      pretty_value do
        Rack::Session::Cookie::Base64::Marshal.new.decode(value)
      end
    end
    field :created_at
    field :updated_at
  end
  
end