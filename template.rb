# frozen_string_literal: true

##
# == Naming template methods
# We propose to use a naming convention for template methods to
# create consistency between this and other Rails templates
# at https://github.com/WeAreSnook.
#
# This documentation uses [RDoc Markup](https://ruby-doc.org/stdlib-2.5.1/libdoc/rdoc/rdoc/RDoc/Markup.html)
#
# === Principles
#
# * Use a verb_ prefix to describe what the method does
# * Use simple language to describe the action
#
# === Suggested prefixes
#
# [add_]  add dependencies
# [create_] create files or directories
# [destroy_] remove files or directories
# [config_] write config files / variables
# [install_] install third party tools
# [generate_] run rails generators

# source_paths
#
#

def source_paths
  [__dir__]
end

##
# Copies the docs directory
#
def create_docs
  directory 'templates/docs', 'docs'
end

def create_readme
  template 'templates/README.md.tt', 'README.md', force: true
end

def create_contributing
  template 'templates/CONTRIBUTING.md.tt', 'CONTRIBUTING.md'
end

def add_test_gem_group
  gem_group :test do
  end
end

def add_simplecov
  insert_into_file 'Gemfile', after: "group :test do" do
    "\tgem 'simplecov', require: false\n"
  end
end

def add_webmock
  insert_into_file 'Gemfile', after: "group :development, :test do" do
    "\n\tgem 'webmock'\n"
  end
end

def add_shoulda_matchers
  insert_into_file 'Gemfile', after: "group :test do" do
    "\n\tgem 'shoulda-matchers', '~> 4.0'\n"
  end
end

def add_climate_control
  insert_into_file 'Gemfile', after: "group :test do" do
    "\n\tgem 'climate_control'\n"
  end
end

def add_factory_bot
  insert_into_file 'Gemfile', after: "group :development, :test do" do
    "\n\tgem 'factory_bot_rails'\n"
  end
end

def add_rspec
  insert_into_file 'Gemfile', after: "group :development, :test do" do
    "\n\tgem 'rspec-rails', '~> 4.0.1'\n"
  end
end

def create_factory_bot_support
  template 'templates/spec/support/factory_bot.rb', 'spec/support/factory_bot.rb'
  insert_into_file 'spec/rails_helper.rb', after: '# Add additional requires below this line. Rails is not loaded until this point!' do
    "require 'support/factory_bot'\n"
  end
end

def create_shoulda_matchers_support
  template 'templates/spec/support/shoulda_matchers.rb', 'spec/support/shoulda_matchers.rb'
  append_to_file 'spec/rails_helper.rb', "require 'support/shoulda-matchers'\n"
end

def create_simplecov_support
  prepend_to_file 'spec/spec_helper.rb', "require 'simplecov'\nSimpleCov.start 'rails'\n\n"
end

def create_webmock_support
  insert_into_file 'spec/rails_helper.rb', after: '# Add additional requires below this line. Rails is not loaded until this point!' do
    "\nrequire 'webmock/rspec'\n"
  end
end

def stop_spring
  run "spring stop"
end

def add_backend_test_tools
  add_test_gem_group
  add_factory_bot
  add_simplecov
  add_shoulda_matchers
  add_webmock
  add_rspec
end

def install_sidekiq
  add_sidekiq
  add_sidekiq_scheduler
  create_sidekiq_initializer
end

def add_sidekiq
  gem 'sidekiq'
end

def add_sidekiq_scheduler
  gem 'sidekiq-scheduler'
end

def create_sidekiq_initializer
  template 'templates/config/initializers/sidekiq.rb', 'config/initializers/sidekiq.rb'
end

def create_dev_procfile(options)
  template 'templates/Procfile.dev.tt', 'Procfile.dev', options
end

def add_dotenv
  insert_into_file 'Gemfile', after: "ruby '#{RUBY_VERSION}'" do
    "\ngem 'dotenv-rails', groups: [:development, :test]"
  end
  template 'templates/.env', '.env'
  template 'templates/.env.template', '.env.template'
end

def add_rubocop
  gem 'rubocop', require: false
end

def add_rubocop_govuk
  gem 'rubocop-govuk'
end

def add_backend_linting_tools
  add_rubocop
  add_rubocop_govuk
end

def create_rubocop_yml
  template 'templates/.rubocop.yml', '.rubocop.yml'
end

## Run the template

source_paths

sidekiq = yes?('Do you want to install sidekiq? [Y/n]')

install_sidekiq if sidekiq
add_dotenv
add_backend_test_tools
add_backend_linting_tools
after_bundle do
  create_docs
  create_readme
  create_contributing
  stop_spring
  generate "rspec:install"
  create_factory_bot_support
  create_shoulda_matchers_support
  create_simplecov_support
  create_webmock_support
  create_dev_procfile({ sidekiq: sidekiq })
  create_rubocop_yml
  git checkout: '-b main'
  git add: '-A .'
  git commit: '-m "setup: GOVUK Rails app setup complete"'
end
