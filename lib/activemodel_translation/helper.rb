require 'active_support'
require 'active_support/core_ext'
require 'active_model'

module ActiveModel
  module Translation
    # Delegates to <tt>I18n#translate</tt> but also performs scoping if key
    # starts with a period. So if you call <tt>translate(".foo")</tt>
    # translation will be searched in <tt>I18N_SCOPE.strings.MODEL.foo</tt>
    # then the same key for all the ancestors and finally in <tt>strings.foo</tt>.
    def translate(key, options = {})
      return I18n.translate(key, options) unless key.to_s.first == '.'

      strings_scope = "#{i18n_scope}.strings"

      defaults = lookup_ancestors.map do |klass|
        :"#{strings_scope}.#{klass.model_name.i18n_key}#{key}"
      end
      defaults << :"strings#{key}"
      defaults << options.delete(:default) if options[:default]

      options[:default] = defaults
      I18n.translate(defaults.shift, options)
    end
    alias :t :translate
  end
end
