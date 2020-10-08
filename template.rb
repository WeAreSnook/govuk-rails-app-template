# source_paths
#
#
def source_paths
  [__dir__]
end

def set_app_name
end

# Docs
# ~~~~~~~~~~~
# 

def create_docs
  directory "docs"
end

source_paths

after_bundle do
  create_docs
end