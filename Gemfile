source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.3'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.3'
# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
# Use Puma as the app server
gem 'puma', '~> 3.11'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'mini_racer', platforms: :ruby
#atualizacao de seguranca informado pelo github Ago19
gem "nokogiri", ">= 1.10.4"
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'
# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'
# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development
# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false
# gem public_suffix-3.1.1
gem 'public_suffix', '~> 3.1.1'
# gem ActiveAdmin - The administration framework for RoR
gem 'activeadmin'
# ActiveAdmin Addons will extend your ActiveAdmin and enable a set of 
#  addons you can optionally use to improve the ActiveAdmin UI and make it awesome
gem 'activeadmin_addons'
# Provides ability to manipulate sidebar position for ActiveAdmim
gem 'active_admin_sidebar'
# Enumerated attributes with I18n and ActiveRecord/Mongoid support 
gem 'enumerize'
# internacionalização i18n 
gem 'rails-i18n'
# Simple theme for ActiveAdmin
gem 'arctic_admin'

# This gem does some CPF/CNPJ magic. It allows you to create, 
#  validate and format CPF/CNPJ, even through the command-line
gem 'validates_cpf_cnpj'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]

end

####### Autenticacao e autorização
### Flexible authentication solution for Rails with Warden
gem 'devise'
### The authorization Gem for Ruby on Rails. 
gem 'cancancan'

group :development do
  # Better Errors replaces the standard Rails error page with a much better and more useful error page.
  gem 'better_errors'
  gem "binding_of_caller"
  # A mini view framework for console/irb that's easy to use, even while under its influence.
  # gem 'hirb'
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  # This gem is a port of Perl's Data::Faker library that generates fake data.
  gem 'faker', :git => 'https://github.com/stympy/faker.git', :branch => 'master'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  # Easy installation and use of chromedriver to run system tests with Chrome
  gem 'chromedriver-helper'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
