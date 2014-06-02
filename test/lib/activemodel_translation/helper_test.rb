require 'test_helper'
require 'activemodel_translation/helper'
require 'models/person'

class ActiveModelI18nTests < Minitest::Test
  def setup
    I18n.backend = I18n::Backend::Simple.new
  end

  def test_lazy_translation
    I18n.backend.store_translations 'en', activemodel: { strings: { person: { type: 'person type' } } }
    assert_equal 'person type', Person.t(:'.type')
  end

  def test_lazy_translation_with_default
    I18n.backend.store_translations 'en', strings: { type: 'person type' }
    assert_equal 'person type', Person.t(:'.type')
  end

  def test_lazy_translation_with_default_option
    assert_equal 'default type', Person.t(:'.type', default: 'default type')
  end

  def test_lazy_translation_with_sti
    I18n.backend.store_translations 'en', activemodel: { strings: { child: { type: 'child type' } } }
    assert_equal 'child type', Child.t(:'.type')
  end

  def test_lazy_translation_with_ancestors_fallback
    I18n.backend.store_translations 'en', activemodel: { strings: { person: { type: 'person type' } } }
    assert_equal 'person type', Child.t(:'.type')
  end
end
