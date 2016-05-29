require 'active_model'

module ActiveModel
  class Name
    def human_plural(options={})
      return @plural unless @klass.respond_to?(:lookup_ancestors) &&
                            @klass.respond_to?(:i18n_scope)

      defaults = @klass.lookup_ancestors.map do |klass|
        klass.model_name.i18n_key
      end

      defaults << options[:default] if options[:default]
      defaults << @plural

      options = { scope: [@klass.i18n_scope, :models_plural], default: defaults }.merge!(options.except(:default))
      I18n.translate(defaults.shift, options)
    end
  end
end
