# ActivemodelTranslation

Lazy translations for models.

`::tranlate` method performs translation with fallback similar to resolving errors.
With one difference - it uses `strings` scope.

* `activemodel.strings.admin.key`
* `activemodel.strings.user.key`
* `strings.key`

`User.model_name.human(plural: true)` returns translated plural model name.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'activemodel_translation'

# or pick a module:
# gem 'activemodel_translation', require: 'activemodel_translation/helper'
# gem 'activemodel_translation', require: 'activemodel_translation/plural'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install activemodel_translation

## Usage

```ruby
class User < ActiveRecord::Base
  # lazy translation
  def title
    super || self.class.t(:'.default_title')
  end
end

# translated plural model name
User.model_name.human(plural: true)

# ru.yml
# activerecord:
#   models:
#     user:
#       one: Пользователь
#       few: Пользователя
#       many: Пользователей
#       other: Пользователя
#       plural: Пользователи
```

## Contributing

1. Fork it ( http://github.com/printercu/activemodel_translation/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
