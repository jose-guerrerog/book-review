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
