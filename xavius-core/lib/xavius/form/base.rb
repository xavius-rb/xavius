require 'active_model'
require 'active_record'

module Xavius
  module Form
    class Base
      include ActiveModel::Model
      include ActiveRecord::AttributeAssignment
    end
  end
end
