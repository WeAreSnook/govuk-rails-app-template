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
  template 'templates/README.md.tt', 'README.md'
end

def create_contributing
  template 'templates/CONTRIBUTING.md.tt', 'CONTRIBUTING.md'
end

source_paths

after_bundle do
  create_docs
  create_readme
  create_contributing
end