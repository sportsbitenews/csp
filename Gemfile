source 'https://rubygems.org'

#region app
gem 'rails', '4.1.0'

ruby "2.1.2"

gem 'pg' #postgres
# Required after migrating to Rails 4.0.
gem 'protected_attributes'
gem 'actionpack-page_caching'
gem 'actionpack-action_caching'
gem 'activerecord-session_store', github: 'rails/activerecord-session_store'
#endregion app

#region server
gem "unicorn", "~> 4.6.2" #webserveris
gem 'capistrano', "~> 2.15.5" #atbild par code deploy
gem "newrelic_rpm" #atbild par servera info nodošanu newrelic 
gem "rack-timeout"
gem 'rvm-capistrano' #atbild par code deploy
gem "whenever", "~> 0.9.0", require: false #atbild par sistēmas cron jobiem 
gem 'resque', require: "resque/server" #async jobu izpildes rīks
gem "resque-loner", "~> 1.2.1" #atļauj iespējamību vienas grupas jobiem tikt izpildītiem pa vienam
gem 'rails_12factor', :group => [:production, :staging]
#endregion server

#region asset_stuff
gem 'sass-rails', '~> 4.0.3' # Use SCSS for stylesheets
gem 'uglifier', '>= 1.3.0' # Use Uglifier as compressor for JavaScript assets
gem 'coffee-rails', '~> 4.0.0' # Use CoffeeScript for .js.coffee assets and views
# gem 'therubyracer',  platforms: :ruby
gem 'jquery-rails' # Use jquery as the JavaScript library
gem 'turbolinks' # Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'jbuilder', '~> 2.0' # Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'sdoc', '~> 0.4.0', group: :doc # bundle exec rake doc:rails generates the API under doc/api.
gem 'bourbon'
gem 'jquery-rails'
gem 'bootstrap-sass', '2.3.2.2'
#region asset_stuff

#region payment_systems
gem "pp-adaptive", "~> 0.0.4"
gem "banklink_lv", github: 'artursbraucs/banklink'
gem 'activemerchant', "~> 1.43.1"
gem 'active_merchant_first_data'
gem 'payu'
#endregion payment_systems

#region super_admin
gem 'rails_admin'
gem 'kaminari' #nodrošina pagination (lapas identifikatorus)
#endregion super_admin

#region utilities
gem 'json'
gem "geocoder"
gem "convertable_values"
gem "madmimi"
gem "mailigen" # , path: '~/repos/mailigen'
gem 'phrase' #lokalizācijas repozitorijs un API, iespējams tulkot runtime
gem 'bcrypt-ruby', '~> 3.0.0'
gem "turnout", "~> 0.2.5" #maintenance gem
gem 'unicode_utils', github: 'lang/unicode_utils', branch: 'master' #atļauj unicode char .downcase etc.
gem "priscilla" #grafiskāks console loggers
#endregion utilities

# Use debugger
# gem 'debugger', group: [:development, :test]

#region testing
group :test do
  gem "factory_girl_rails"
  gem "capybara"
  gem "guard-rspec"
  gem 'rb-fsevent', '~> 0.9.1'
end
#endregion testing

#region development
group :development do
  gem 'spring' # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem "rails_best_practices" #ģenerē reportu, kur nav izmantota labā prakse
  gem "simplecov" #ģenerē rspec testu coverage report
end
#endregion development

#region debugging
group :development, :staging do
  gem "better_errors" #nodrošina detalizētākus error paziņojumus
  gem "binding_of_caller" #better errors REPL and local/instance variable inspection
end
#endregion debugging

#region debug dev and test
group :development, :test do
  gem "rspec-rails"
  gem "faker" #šis ģenerē dummy/fake datus pēc pieprasījuma
end
#endregion debug dev and test
