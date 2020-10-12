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

## Run the template

source_paths
sidekiq = yes?('Do you want to install sidekiq? [Y/n]')

install_sidekiq if sidekiq
add_dotenv
after_bundle do
  create_docs
  create_readme
  create_contributing
  create_dev_procfile({ sidekiq: sidekiq })
end
