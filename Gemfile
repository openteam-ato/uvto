source :rubygems

group :assets do
  gem 'coffee-rails'
  gem 'therubyracer'                                unless RUBY_PLATFORM =~ /freebsd/
  gem 'uglifier'
end

group :default do
  gem 'compass-rails'
  gem 'curb'
  gem 'el_vfs_client'
  gem 'esp-commons'
  gem 'hashie'
  gem 'jquery-rails'
  gem 'kaminari'
  gem 'openteam-commons'
  gem 'rails',                  '~>3.2.12'
  gem 'russian'
  gem 'sass-rails'
  gem 'stop_ie'
  gem 'uuid'
end

group :production do
  gem 'unicorn', :require => false
end

group :development do
  gem 'brakeman'
end
