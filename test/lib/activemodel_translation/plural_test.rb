require 'test_helper'
require 'activemodel_translation/plural'
require 'models/person'

class ActiveModelHumanNameTests < ::Minitest::Test
  def setup
    I18n.backend = I18n::Backend::Simple.new
    I18n.backend.store_translations 'ru', activemodel: { models: { person: {
      one:    'Пользователь',
      few:    'Пользователя',
      many:   'Пользователей',
      other:  'Пользователя',
      plural: 'Пользователи',
    } } }
    I18n.locale = :ru
    @person_name = ActiveModel::Name.new(Person)
    @child_name = ActiveModel::Name.new(Child)
    @gender_name = ActiveModel::Name.new(Person::Gender)
  end

  def teardown
    I18n.locale = :en
  end

  def test_human_with_translation
    assert_equal 'Пользователь', @person_name.human
  end

  def test_human_with_fallback_translation
    assert_equal 'Пользователь', @child_name.human
  end

  def test_human_without_translation
    assert_equal 'Gender', @gender_name.human
  end

  def test_human_with_count_with_translation
    assert_equal 'Пользователя', @person_name.human(count: 1.5)
  end

  def test_human_with_count_with_fallback_translation
    assert_equal 'Пользователя', @child_name.human(count: 1.5)
  end

  def test_human_with_count_without_translation
    assert_equal 'Gender', @gender_name.human(count: 1.5)
  end

  def test_plural_human_with_translation
    assert_equal 'Пользователи', @person_name.human(plural: true)
  end

  def test_plural_human_with_fallback_translation
    assert_equal 'Пользователи', @child_name.human(plural: true)
  end

  def test_plural_human_without_translation
    assert_equal 'person_genders', @gender_name.human(plural: true)
  end
end
