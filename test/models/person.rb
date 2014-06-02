class Person
  extend  ActiveModel::Translation
end

class Person
  class Gender
    extend  ActiveModel::Translation
  end
end

class Child < Person
end
