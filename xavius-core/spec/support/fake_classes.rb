class ModelTest
  attr_reader :errors

  class << self
    def find_by(attrs = {})
    end
  end

  def initialize(*)
    @errors = ActiveModel::Errors.new(self)
  end

  def valid?
    true
  end

  def save
    true
  end

  def assign_attributes(attrs)
  end

  def update(attrs)
  end
end

class CreateModelTestsForm < Xavius::Form::Base
end

class CreateModelTestsWithErrorsForm < Xavius::Form::Base
  attr_accessor :name
  def valid?
    errors.add(:name, :blank)
    false
  end
end

class Post < ModelTest
  attr_accessor :title, :id
end

class Product < ModelTest
  attr_accessor :name, :id
end
