# This class was only created to solve this error in production:
# ❯ RAILS_ENV=production bin/rails zeitwerk:check

# Hold on, I am eager loading the application.
# expected file /home/[user]/.asdf/installs/ruby/3.2.1/lib/ruby/gems/3.2.0/gems/devise-4.9.4/app/mailers/devise/mailer.rb to define constant Devise::Mailer, but didn't       
module Devise
  class Mailer
  end
end
