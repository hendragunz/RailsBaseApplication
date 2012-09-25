module Domikado
  module Controller
    module Filter
      extend ActiveSupport::Concern

      included do
        class_eval do
          class_attribute :filters
        end
      end

      module ClassMethods
        def filter_with(name, options={}, &block)
          filter = {}
          filter[:param_name] = options.delete(:param_name) || name
          filter[:block] = block

          self.filters = self.filters || {}
          self.filters[name] = filter
        end
      end

      def apply_filter(scope, *selected)
        filters_to_apply = selected.present? ? self.filters.slice(*selected) : self.filters
        filters_to_apply.each do |name, filter|
          scope = filter[:block].call(scope, params[filter[:param_name]]) if params[filter[:param_name]]
        end
        scope
      end
    end
  end
end
