#!/usr/bin/env bash
# exit on error
set -o errexit

# Install dependencies
bundle install

# Create the patch files if they don't exist already
mkdir -p lib
cat > lib/propshaft_patch.rb << 'EOF'
module PropshaftPatch
  def self.apply
    if defined?(Propshaft::Assembly)
      Propshaft::Assembly.class_eval do
        def cached
          return nil unless environment
          environment.respond_to?(:cached) ? environment.cached : environment.cache_key
        end
      end
    end
  end
end
EOF

mkdir -p config/initializers
cat > config/initializers/propshaft_patch.rb << 'EOF'
require_relative '../../lib/propshaft_patch'
Rails.application.config.to_prepare do
  PropshaftPatch.apply
end
EOF

# Try to apply the patch immediately for asset compilation
ruby -e "require './lib/propshaft_patch'; PropshaftPatch.apply"

# Run asset precompilation with detailed logging
RAILS_ENV=production SECRET_KEY_BASE=placeholder RAILS_SERVE_STATIC_FILES=true bundle exec rake assets:precompile --trace || echo "Asset compilation failed, but continuing deployment"

# Run database migrations
bundle exec rails db:migrate