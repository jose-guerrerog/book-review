require_relative '../../lib/propshaft_patch'
Rails.application.config.to_prepare do
  PropshaftPatch.apply
end