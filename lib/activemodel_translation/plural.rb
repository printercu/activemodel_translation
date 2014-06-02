require 'active_model'

module ActiveModel
  class Name
    def human(options={})
      return @human unless @klass.respond_to?(:lookup_ancestors) &&
                           @klass.respond_to?(:i18n_scope)

      need_plural = options[:plural]

      defaults = @klass.lookup_ancestors.map do |klass|
        klass.model_name.i18n_key
      end
      defaults = defaults.map { |key| :"#{key}.plural" } if need_plural

      defaults << options[:default] if options[:default]
      defaults << (need_plural ? @plural : @human)

      options = { scope: [@klass.i18n_scope, :models], count: 1, default: defaults }.merge!(options.except(:default))
      I18n.translate(defaults.shift, options)
    end
  end
end
